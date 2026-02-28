{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = builtins.attrValues {
    inherit (inputs.hardware.nixosModules)
      common-cpu-intel
      common-pc-ssd
      common-gpu-nvidia-nonprime
      ;
  };
  environment.systemPackages = [
    pkgs.rnnoise-plugin
  ];
  security.rtkit.enable = true;
  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
    };
    # Enable CUPS to print documents.
    printing.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    pulseaudio.enable = false;

    pipewire = {
      enable = true;
      # Enable sound with pipewire.
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # jack.enable = true;
      extraConfig = {
        # https://discourse.nixos.org/t/pipewire-rnnoise-module-wont-work/58975/12
        pipewire."99-input-denoising" = {
          "context.modules" = [
            {
              name = "libpipewire-module-filter-chain";
              args = {
                "node.description" = "Noise Canceling source";
                "media.name" = "Noise Canceling source";
                "filter.graph" = {
                  nodes = [
                    {
                      type = "ladspa";
                      name = "rnnoise";
                      plugin = "${pkgs.rnnoise-plugin}/lib/ladspa/librnnoise_ladspa.so";
                      label = "noise_suppressor_mono";
                      control = {
                        "VAD Threshold (%)" = 50.0;
                        "VAD Grace Period (ms)" = 200;
                        "Retroactive VAD Grace (ms)" = 0;
                      };
                    }
                  ];
                };
                "capture.props" = {
                  "node.name" = "capture.rnnoise_source";
                  "node.passive" = true;
                  "audio.rate" = 48000;
                };
                "playback.props" = {
                  "node.name" = "rnnoise_source";
                  "media.class" = "Audio/Source";
                  "audio.rate" = 48000;
                };
              };
            }
          ];
        };
      };
    };
  };

  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=1"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    "nvidia.NVreg_TemporaryFilePath=/var/tmp"
    "nvidia.NVreg_EnableGpuFirmware=0"
  ];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.production;
      modesetting.enable = true;
    };
  };
}

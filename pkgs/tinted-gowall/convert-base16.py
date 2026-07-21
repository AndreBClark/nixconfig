#!/usr/bin/env python3
import sys
import yaml
import pathlib
from glob import glob

def convert_base16_to_gowall(themes_dir, output_file):
    """Convert base16 yaml schemes to gowall config.yml format."""

    themes_dir = pathlib.Path(themes_dir)
    output = []

    # Get all yaml files in the themes directory
    yaml_files = glob(str(themes_dir / "*.yaml"))

    for yaml_file in sorted(yaml_files):
        with open(yaml_file, 'r') as f:
            data = yaml.safe_load(f)

        # Extract scheme name and colors
        scheme_name = data.get('scheme', 'Unknown')

        # Base16 defines 16 colors: base00 through base0F
        color_keys = [f'base{i:02X}' for i in range(16)]
        colors = [data.get(key, '#000000') for key in color_keys]

        # Build the theme entry in gowall format
        theme_entry = {
            'name': scheme_name,
            'colors': colors
        }
        output.append(theme_entry)

    # Write the output YAML file
    with open(output_file, 'w') as f:
        yaml.dump({'themes': output}, f, default_flow_style=False, sort_keys=False)

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <themes_dir> <output_file>")
        sys.exit(1)

    themes_dir = sys.argv[1]
    output_file = sys.argv[2]
    convert_base16_to_gowall(themes_dir, output_file)

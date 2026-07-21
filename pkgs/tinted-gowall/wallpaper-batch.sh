DEFAULT_INPUT_DIR="$HOME/Pictures/Wallpapers"
DEFAULT_OUTPUT_BASE="$HOME/Pictures"

input_dir="$DEFAULT_INPUT_DIR"
theme_name=""

# Parse flags
while [ $# -gt 0 ]; do
  case "$1" in
    -i|--input)
      input_dir="$2"
      shift 2
      ;;
    *)
      theme_name="$1"
      shift
      ;;
  esac
done

if [ -z "$theme_name" ]; then
  echo "Usage: wallpaper-batch -i [INPUT_DIR] THEME_NAME"
  exit 1
fi

folder_name=$(echo "$theme_name" | sed 's/ /-/g; s/[()]//g')
output_dir="$DEFAULT_OUTPUT_BASE/Wallpaper-$folder_name"

mkdir -p "$output_dir"

# Count images in input directory (recursive)
input_count=$(find "$input_dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.avif" \) | wc -l)

# Count images in output directory
output_count=$(find "$output_dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.avif" \) | wc -l)

# Skip if counts match
if [ "$input_count" -eq "$output_count" ] && [ "$input_count" -gt 0 ]; then
  echo "Skipping: Output folder already has $input_count images (matches input)"
  exit 0
fi

# Find first image for preview
first_img=$(find "$input_dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.avif" \) | head -n1)

if [ -n "$first_img" ]; then
  echo "Previewing theme '$theme_name' on $(basename "$first_img")..."
  # Pass theme name directly - gowall will resolve it from config.yml
  gowall convert "$first_img" -t "$theme_name" --preview true

  read -p -r "Apply this theme to all images? (y/N): " confirm

  if [ ! "$confirm" = "y" ] && [ ! "$confirm" = "Y" ]; then
    echo "Cancelled."
    exit 0
  fi
fi

# Proceed with batch processing - pass theme name directly
gowall convert --dir "$input_dir" --output "$output_dir" -t "$theme_name" --yes

echo "Processed images from $input_dir (including subdirectories) to $output_dir"

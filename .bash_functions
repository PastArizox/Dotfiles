# extract
function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      rar x $1        ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Get branch name for PS1
function git_branch() {
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo "-[$branch]"
    fi
}

# Function to get video resolution
function resolution() {
  # Check if ffprobe is installed
  if ! command -v ffprobe &> /dev/null; then
    echo "ffprobe is not installed. Please install FFmpeg."
    return 1
  fi

  # Check if a video file path is provided
  if [ -z "$1" ]; then
    echo "Please provide the video file path."
    return 1
  fi

  # Get the video resolution
  resolution=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$1")

  # Check if the command was successful
  if [ $? -ne 0 ]; then
    echo "Unable to retrieve the video resolution."
    return 1
  fi

  echo "The resolution of the video is: $resolution"
}

# Function to determine the quality of the video based on its resolution
function quality() {
  # Check if ffprobe is installed
  if ! command -v ffprobe &> /dev/null; then
    echo "ffprobe is not installed. Please install FFmpeg."
    return 1
  fi

  # Check if a video file path is provided
  if [ -z "$1" ]; then
    echo "Please provide the video file path."
    return 1
  fi

  # Get the resolution of the video
  resolution=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$1")

  # Check if the command was successful
  if [ $? -ne 0 ]; then
    echo "Unable to retrieve the video resolution."
    return 1
  fi

  # Extract width and height from the resolution
  width=$(echo $resolution | cut -d 'x' -f 1)
  height=$(echo $resolution | cut -d 'x' -f 2)

  # Determine the quality based on the resolution
  if [ "$width" -le 640 ] && [ "$height" -le 360 ]; then
    quality="360p"
  elif [ "$width" -le 854 ] && [ "$height" -le 480 ]; then
    quality="480p"
  elif [ "$width" -le 1280 ] && [ "$height" -le 720 ]; then
    quality="720p"
  elif [ "$width" -le 1920 ] && [ "$height" -le 1080 ]; then
    quality="1080p"
  else
    quality="Resolution too high (higher than 1080p)"
  fi

  echo $quality
}

function search() {
    find . -iname "*$1*"
}

# Lazygit change directory
lg()
{
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}

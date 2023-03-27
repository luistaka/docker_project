# docker_project
https://thiagolopessilva.medium.com/dockerizando-o-seu-ambiente-de-desenvolvimento-node-com-o-batect-57a8c95f00cb

# requirement for Linux and macOS​

# - Docker 18.03.1 or later (Docker 19.03 or later highly recommended)
docker --version
# Docker version 20.10.23
# - Java 8 or newer (although this requirement will be removed before Batect v1.0)
java -version
# openjdk version "1.8.0_292"

# - Install Batect: download batect and batect.cmd
https://batect.dev/docs/getting-started/installation/

# - On Linux or macOS, make sure the script is executable:
chmod +x batect
# chmod +x on a file (your script) only means, that you'll make it executable. Right click on your script and chose Properties -> Permissions -> Allow executing file as program, leaves you with the exact same result as the command in terminal.

# create a file using the cat command and write:
cat > batect.yml
# Now type your lines of text. When done and you need to save and exit, press Ctrl+D to return to the bash shell prompt.

# create a file using the cat command without write right after:
touch batect.yml
> batect.yml
echo "While I thought that I was learning how to live, I have been learning how to die." > quote1.txt
printf 'Study nature, love nature, stay close to nature. It will never fail you.\n' > quote1.txt

# Use the the >> instead of > to append data to existing file and to avoid overwriting files. The syntax is as follows:
printf 'While I thought that I was learning how to live, I have been learning how to die.' >> quote1.txt

# To view file use cat
cat batect.yml

# Check batect and list all available tasks
./batect --list-tasks

# Install dependencies
./batect setup

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Poetry: Finally an all-in-one tool to manage Python packages
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Instalação do poetry
https://www.subcul-science.com/post/20210520poetry/
curl -sSL https://install.python-poetry.org | python3.9 -
export PATH="/Users/luis.takahashi/.local/bin:$PATH"

poetry --version
# Install the project
poetry install

# Initialize a project if you already have a directory
poetry init
# Initialize a project if you do not have a directory
poetry new poet

# Change version with env use
poetry env use 3.9
# Handle virtual environment
poetry env info
poetry debug info

# List dependencies
poetry show --tree

# create poetry.lock file
poetry lock

# Installand remove new libs
poetry add requests
poetry add -D pytest
poetry remove requests

# build a package
poetry build

# Instalação do pyenv
curl https://pyenv.run | bash
Após a instalação, adicione as seguintes linhas ao seu arquivo ~/.bash_profile:
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# job local

poetry run spark-submit \
    --master local \
    --py-files dist/poet-*.whl \
    poet/etl/test_poet.py \
    "./poet/resource/citibike.csv" \
    "./output_int"

# job docker 
JOB=citibike_ingest ./batect run-job
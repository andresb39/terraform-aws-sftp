# Autor: @andresb39
# Date: Marzo 2023
# TODO: Install pre requirements for pre-commit checks

set -o errexit # exit on errors

# terraform version

terraform --version > /dev/null
tfenv list > /dev/null

# install pre-commit hooks
pip3 install --no-cache-dir pre-commit
pip3 install --no-cache-dir checkov

# Download and install Terraform Docs
curl -L "$(curl -s https://api.github.com/repos/terraform-docs/terraform-docs/releases/latest | grep -o -E -m 1 "https://.+?-linux-amd64.tar.gz")" > terraform-docs.tgz &&
tar -xzf terraform-docs.tgz terraform-docs &&
rm terraform-docs.tgz &&
chmod +x terraform-docs &&
sudo mv terraform-docs /usr/bin/

# Download and install Terrascan
curl -L "$(curl -s https://api.github.com/repos/tenable/terrascan/releases/latest | grep -o -E -m 1 "https://.+?_Linux_x86_64.tar.gz")" > terrascan.tar.gz &&
tar -xzf terrascan.tar.gz terrascan &&
rm terrascan.tar.gz &&
sudo mv terrascan /usr/bin/ &&
terrascan init

# Download and install TFLint
curl -L "$(curl -s https://api.github.com/repos/terraform-linters/tflint/releases/latest | grep -o -E -m 1 "https://.+?_linux_amd64.zip")" > tflint.zip &&
unzip tflint.zip &&
rm tflint.zip &&
sudo mv tflint /usr/bin/

# Download and install tfsec
curl -L "$(curl -s https://api.github.com/repos/aquasecurity/tfsec/releases/latest | grep -o -E -m 1 "https://.+?tfsec-linux-amd64")" > tfsec &&
chmod +x tfsec &&
sudo mv tfsec /usr/bin/

# Install jq using apt
sudo apt install -y jq && \

# Download and install tfupdate
curl -L "$(curl -s https://api.github.com/repos/minamijoyo/tfupdate/releases/latest | grep -o -E -m 1 "https://.+?_linux_amd64.tar.gz")" > tfupdate.tar.gz &&
tar -xzf tfupdate.tar.gz tfupdate &&
rm tfupdate.tar.gz &&
sudo mv tfupdate /usr/bin/

# Download and install hcledit
curl -L "$(curl -s https://api.github.com/repos/minamijoyo/hcledit/releases/latest | grep -o -E -m 1 "https://.+?_linux_amd64.tar.gz")" > hcledit.tar.gz &&
tar -xzf hcledit.tar.gz hcledit &&
rm hcledit.tar.gz &&
sudo mv hcledit /usr/bin/

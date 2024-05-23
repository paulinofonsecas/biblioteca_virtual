#!/bin/env bash

# Crie um diretório temporário para dados do usuário do Chrome
mkdir -p /tmp/chrome_dev_test

# Inicie o Chrome com flags desativando a segurança da web e o isolamento do site
# Substitua '/usr/bin/google-chrome' pelo caminho do seu executável do Chrome
/usr/bin/google-chrome \
  --args \
  --user-data-dir="/tmp/chrome_dev_test" \
  --disable-web-security \
  --disable-site-isolation-trials \
  "$@"

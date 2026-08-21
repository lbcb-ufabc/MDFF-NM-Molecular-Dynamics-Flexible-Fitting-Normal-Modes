# Requisitos do Sistema

Para rodar este projeto, você precisa ter instalado:
- **R** (versão 4.6.0)
- **R** - Pacote **bio3d**
- **VMD** (versão 1.9.4)
- **NAMD2**
- **CATDCD**
  - como instalar o CATDCD no Linux:
      - wget https://www.ks.uiuc.edu/Development/MDTools/catdcd/catdcd-4.0.tar.gz
      - tar -xvf catdcd-4.0.tar.gz
      - cd catdcd-4.0
      - make LINUX
      - sudo mv catdcd /usr/local/bin/
      - catdcd (para confirmar a instalação)

## Instalação do pacote bio3d no R
Execute o comando no R ou no RStudio: install.packages("bio3d")

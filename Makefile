setup:
	@conda env create || conda env update

dirs:
	@mkdir -p data/raw
	@mkdir -p data/features
	@mkdir -p data/models

download:
	@bash scripts/download_data.sh

features:
	@python features.py

train:
	@python train.py

build:
	@bentoml build

serve:
	@bentoml serve bbb-model:latest --port 8085

containerize:
	@bentoml containerize bbb-model:latest --opt --output-dir ./bentoml_build

deploy:
	@git push render main

all: download features train build container deploy

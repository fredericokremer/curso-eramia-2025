setup:
	@conda env create || conda env update

features:
	@python features.py

train:
	@python train.py

build:
	@bentoml build

serve:
	@bentoml serve bbb-model:latest --port 8085

containerize:
	@bentoml containerize bbb-model:latest

deploy:
	@git push render main

all: download features train build container deploy

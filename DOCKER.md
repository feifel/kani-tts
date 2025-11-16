# How to run it in Docker
This fork is created to run a local finetuned model in a docker container.

## Precondictions
Create your local finetuned model by using this project:  https://github.com/feifel/kani-tts-training-docker

Put your local finetuned model in the `models` directory. And configure it in the config.py file. E.g.:
```bash
MODEL_NAME = "/app/models/Linda-tts-v1-lora16"
```
The content of that folder should look like this:
```bash
chat_template.jinja
config.json
generation_config.json
model.safetensors
special_tokens_map.json
tokenizer_config.json
tokenizer.json
```

## Build the docker image
```bash
docker build -t kani-tts .
```

## Run the docker container
```bash
docker run --gpus all -p 8000:8000 \
    -v $(pwd)/models:/app/models \
    -v $(pwd)/cache:/app/cache \
    -v $(pwd)/output:/app/output \
    kani-tts
```

## Test the TTS 
Open the following file in your browser:
```bash
examples/basic/client.html
```
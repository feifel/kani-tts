# How to run it in Docker
This fork is created to run a local finetuned model in a docker container.

## Precondictions
Create your local finetuned model by using this project:  https://github.com/feifel/kani-tts-training-docker

Put your local finetuned model in a dedicated directory inside the `models` directory or download one of the exiting models (e.g. https://huggingface.co/nineninesix/kani-tts-400m-de/tree/main). 
The `models` folder should look like this:
```bash
models
└── your_model_name/
    ├── chat_template.jinja
    ├── config.json
    ├── generation_config.json
    ├── model.safetensors
    ├── special_tokens_map.json
    ├── tokenizer_config.json
    └── tokenizer.json
```

Configure the model in the config.py file. E.g.:
```bash
MODEL_NAME = "/app/models/your_model_name"
```

**Note:** Since the config.py is mounted as a volume, any changes made to it will be reflected immediately without rebuilding the Docker image. Just restart the container to apply the changes.

## Run with Docker Compose
You can also use docker compose to run the project.

Start the container (detached mode):
```bash
docker compose up -d
```

View logs:
```bash
docker compose logs -f
```

Stop the container:
```bash
docker compose down
```

## Test the TTS 
Open the following file in your browser:
```bash
examples/basic/client.html
```

In case you have a multi speeker model, you can select the speeker by prefixing the text with the speeker e.g.:
~~~
Linda: Mein Name ist Linda, ich bin ein Text To Speach Modell.
Oliver: Mein Name ist Oliver, ich bin auch ein Text To Speach Modell.
~~~
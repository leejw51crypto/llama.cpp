make LLAMA_CUBLAS=1
cd finetuning && python mytrain.py && cd -
cp -Rf ./finetuning/saved_model_directory ./models/7B
python3 convert.py models/7B/
./quantize ./models/7B/ggml-model-f16.gguf ./models/7B/ggml-model-q4_0.gguf q4_0
./main -m ./models/7B/ggml-model-q4_0.gguf -n 128 -p "what is rust lang?"

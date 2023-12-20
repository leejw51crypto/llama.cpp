python3 -m pip install -r requirements.txt
python3 convert.py models/7B/
./build/bin/quantize ./models/7B/ggml-model-f16.gguf ./models/7B/ggml-model-q4_0.gguf q4_0
./build/bin/quantize ./models/7B/ggml-model-q4_0.gguf ./models/7B/ggml-model-q4_0-v2.gguf COPY
./build/bin/main -m ./models/7B/ggml-model-q4_0.gguf -n 128

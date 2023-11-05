# Define a variable for the directory path
model_directory="./finetuning/saved_model_directory/"

# Use the variable in your script
#python3 convert.py "$model_directory"
#./build/bin/quantize "$model_directory/ggml-model-f16.gguf" "$model_directory/ggml-model-q4_0.gguf" "q4_0"
./main -m "$model_directory/ggml-model-q4_0.gguf" -n 128 -p "what is rust lang?"

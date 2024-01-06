#./compile.sh
./finetune.sh

# get f16
python convert.py ./finetuning/mymodel
./build/bin/quantize ./finetuning/mymodel/ggml-model-f16.gguf ./finetuning/mymodel/ggml-model-q4_0.gguf q4_0
echo "Quantized model is ggml-model-q4_0.gguf"
echo "cp ./finetuning/mymodel/ggml-model-q4_0.gguf ." 
echo "use https://github.com/oobabooga/text-generation-webui to run the model"

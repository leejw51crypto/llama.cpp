#./compile.sh
#./finetune.sh

python convert-hf-to-gguf.py ./finetuning/mymodel
#quantize ./finetuning/mymodel/ggml-model-f16.gguf ./finetuning/mymodel/ggml-model-q4_0.gguf q4_0
#cp ggml-model-q4_0.gguf . 
echo "Quantized model is ggml-model-q4_0.gguf"
echo "use https://github.com/oobabooga/text-generation-webui to run the model"
echo "copy ggml-model-q4_0.gguf to text-generation-webui/models"

#!/usr/bin/env python
# coding: utf-8

# In[1]:


from transformers import AutoModelForCausalLM, AutoConfig, AutoTokenizer, pipeline
import torch

#model_path="facebook/opt-350m"
model_path='./saved_model_directory'

config = AutoConfig.from_pretrained(model_path)
model = AutoModelForCausalLM.from_pretrained(model_path, load_in_8bit=True, device_map="auto")

tokenizer = AutoTokenizer.from_pretrained(model_path)
params = {
        "max_length":4048,
        "pad_token_id": 0, 
        "device_map":"auto", 
        "load_in_8bit": True,
        }
pipe = pipeline(
    task="text-generation",
    model=model,
    tokenizer=tokenizer,
    model_kwargs=params
)

#result=pipe("where is hk?")
print("Enter a prompt:")
#prompt = input()
prompt = "what is rust lang?"
with torch.no_grad():
    generated_text = pipe(prompt, max_length=2000, do_sample=True, top_k=50)[0]['generated_text']
    print(generated_text)


# In[2]:


prompt = "where is hk?"
with torch.no_grad():
    generated_text = pipe(prompt, max_length=2000, do_sample=True, top_k=50)[0]['generated_text']
    print(generated_text)


# In[3]:


prompt = "is bitcoin good?"
with torch.no_grad():
    generated_text = pipe(prompt, max_length=200, do_sample=True, top_k=50)[0]['generated_text']
    print(generated_text)


# In[4]:


# Assuming 'pipe' is your text generation pipeline
model_device = pipe.model.device
print("Pipeline is using device:", model_device)

# You can also check the device for the model's parameters
model_parameters_device = next(pipe.model.parameters()).device
print("Model parameters are on device:", model_parameters_device)


# In[ ]:





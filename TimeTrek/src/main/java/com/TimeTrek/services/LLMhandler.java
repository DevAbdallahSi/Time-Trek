package com.TimeTrek.services;

import java.io.IOException;

import java.net.URISyntaxException;

import com.TimeTrek.models.User;

import io.github.ollama4j.OllamaAPI;
import io.github.ollama4j.exceptions.OllamaBaseException;
import io.github.ollama4j.models.response.Model;

public class LLMhandler {
	private static String host="http://localhost:11434/";
	private static String modelName = "hf.co/unsloth/Llama-3.2-1B-Instruct-GGUF:Q4_K_M";
	static String systemprompt="respond with a short and concise, helpful suggestion based on the following inputs:";
	
	
	
	public static String generate(String input) {
		
		try {
//			return new OllamaAPI(host).generate(getModel(),systemprompt+input,null).getResponse();
			return new OllamaAPI(host).generate(modelName,systemprompt+input,null).getResponse();
		} catch (OllamaBaseException | IOException | InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return"error";
		
		
	}
	public static String getResponse(String time, String mood, String status) {
		
		
		return generate("the user has "+time+" minutes, mood seems to be "+mood+", and this is what is on their mind: "+status);
	}
	
// 	uses the user object to import personal goals to send them
	
	public static String getResponse(User user, String time, String mood, String status) {
		
		String goals="add looped through personal goals here, separated by commas or wtv";
		return getResponse(time,mood,status+", personal goals are as noted:"+goals);
	}
	
// another idea is to suggest new personal goals, using some previous information like the history and other goals as to no repeat them.
	
	
	
	//keep in mind this is the LLM model
	private static String getModel() {
		
			try {
				return new OllamaAPI(host).listModels().get(0).getModel();
			} catch (OllamaBaseException | IOException | InterruptedException | URISyntaxException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return null;

	}
}

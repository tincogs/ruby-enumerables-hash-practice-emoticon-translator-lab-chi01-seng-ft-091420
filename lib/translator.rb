require "yaml"
require "pry" 
def load_library(file_path)
    library = YAML.load_file(file_path)
    emoticons = {}
    library.each do |key,value|
      emoticons[key] = {}
      emoticons[key][:english] = value[0]
      emoticons[key][:japanese] = value[1]
    end
    emoticons
end

def get_english_meaning(file_path, japan_emoji)
  emoticon_hash = load_library(file_path)
  translation = "Sorry, that emoticon was not found"
  emoticon_hash.find do |key,value|
    if emoticon_hash[key][:japanese] == japan_emoji
     translation = "#{key}"
     break if translation = "#{key}"
  end
  end
  translation
end

def get_japanese_emoticon(file_path, eng_emoji)
 emoticon_hash = load_library(file_path)
 equivalent = "Sorry, that emoticon was not found"
  emoticon_hash.find do |key,value|
    if emoticon_hash[key][:english] == eng_emoji
      equivalent = emoticon_hash[key][:japanese]
      break if equivalent = emoticon_hash[key][:japanese]
  end
end
equivalent
end
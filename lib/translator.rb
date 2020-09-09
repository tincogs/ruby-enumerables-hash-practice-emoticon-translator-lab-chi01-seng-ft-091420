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
  translation = ""
  emoticon_hash.find do |key,value|
    if emoticon_hash[key][value] == japan_emoji
     translation = "#{key}"
     break if translation = "#{key}"
    translation = "Sorry, that emoticon was not found"
  end
  end
  translation
end

def get_japanese_emoticon(file_path, eng_emoji)
 emoticon_hash = load_library(file_path)
 equivalent = ""
  emoticon_hash.find do |key,value|
    if emoticon_hash[key][value] == eng_emoji
      equivalent = emoticon_hash[key][:japanese]
      break if equivalent = emoticon_hash[key][:japanese]
    equivalent = "Sorry, that emoticon was not found"
  end
end
equivalent
end
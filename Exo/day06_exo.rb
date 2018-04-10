####################### MULTIPLE DE 3 ET 5 ##########################

def multiple35
  result = 0
  for i in 1...1000 #boucle for pour parcourir les chiffre de 1 à 1000
    if i%3 == 0 || i%5 == 0 #On check si c'est des multiples de 3 ou 5
      result += i #Si mutliple de 3 ou 5 on rajoute
    end
  end
    puts "result = #{result}"
    result
end

#multiple35

####################### CHIFFRER DES DONNEES ##########################

def chiffre_de_cesar(string,shift)
  result = [] #Init tableau vide => Resultat
  string.each_byte { |letter| result << letter } #On transforme le string en tableau de Ascii	
  result.collect! do |ascii| #On check chaque valeur du tableau
    if (ascii > 64 && ascii < 91) #On check les majuscules
      ascii += shift
      if (ascii >= 91) #On check si ça passe au dela
        ascii -= 26
      end
    elsif (ascii > 96 && ascii < 123) #On check les minuscules
      ascii += shift
      if (ascii >= 123) #On check si ça passe au dela
        ascii -= 26
      end
    end 
    ascii.chr #On transforme en string chaque valeur
  end
  puts "result = #{result.join("")}" 
  result.join("") #On passe de tableau en string
end 

#chiffre_de_cesar("A B C D E!FG??HIJKLMxyzYZ",5)

####################### STOCK PICKER ##########################


def trader_du_dimanche(array)
  min_value = [array[0],0] #[value,index]
  max_value = [array[0],0] #[value,index]
  best_price = 0
  puts array[1]
  for i in 1...array.length
    unless array[i+1].nil? 
      if min_value[0] > array[i] && best_price < array[i+1] - array[i]
        min_value[0] = array[i]
        min_value[1] = i
        max_value[0] = array[i+1]
        max_value[1] = i + 1
        best_price = max_value[0] - min_value[0]
      end
      if best_price < array[i] - min_value[0]
        max_value[0] = array[i]
        max_value[1] = i
        best_price = max_value[0] - min_value[0]
      end
    end
  end
  puts "min_value = #{min_value}"
  puts "max_value = #{max_value}"
  puts "best_price = #{best_price}"
end

#trader_du_dimanche([17,3,6,9,15,8,6,1,10]) #12
#trader_du_dimanche([5,4,8,4,3,8,10]) #7
#trader_du_dimanche([12,3,15,6,4,8,2])

jour_1 = { :GOO => 15, :MMM => 14, :ADBE => 12, :EA=> 13, :BA => 8, :KO => 10, :XOM => 20, :GPS => 7, :MCD => 11, :DIS => 15, :CRM => 6, :JNJ => 10 }
jour_2 = { :GOO => 8, :MMM => 20, :ADBE => 3, :EA=> 10, :BA => 5, :KO => 19, :XOM => 12, :GPS => 6, :MCD => 15, :DIS => 9, :CRM => 10, :JNJ => 17 }
jour_3 = { :GOO => 3, :MMM => 8, :ADBE => 15, :EA=> 5, :BA => 10, :KO => 5, :XOM => 15, :GPS => 13, :MCD => 10, :DIS => 18, :CRM => 5, :JNJ => 14 }
jour_4 = { :GOO => 17, :MMM => 3, :ADBE => 6, :EA=> 9, :BA => 15, :KO => 6, :XOM => 8, :GPS => 1, :MCD => 10, :DIS => 15, :CRM => 18, :JNJ => 3 }
jour_5 = { :GOO => 8, :MMM => 18, :ADBE => 4, :EA=> 6, :BA => 15, :KO => 18, :XOM => 3, :GPS => 12, :MCD => 19, :DIS => 3, :CRM => 7, :JNJ => 9 }
jour_6 = { :GOO => 10, :MMM => 12, :ADBE => 8, :EA=> 3, :BA => 18, :KO => 20, :XOM => 5, :GPS => 11, :MCD => 3, :DIS => 9, :CRM => 8, :JNJ => 15 }
jour_7 = { :GOO => 17, :MMM => 14, :ADBE => 2, :EA=> 17, :BA => 7, :KO => 13, :XOM => 1, :GPS => 15, :MCD => 15, :DIS => 10, :CRM => 9, :JNJ => 17 }

hash_week = [jour_1,jour_2,jour_3,jour_4,jour_5,jour_6,jour_7]

def trader_du_lundi(array_of_hash)
  table_GOO = []
  table_MMM = []
  table_ADBE = []
  table_EA = []
  table_BA = []
  table_KO = []
  table_XOM = []
  table_GPS = []
  table_MCD = []
  table_DIS = []
  table_CRM = []
  table_JNJ = []
  company_table = []

  for i in 0...array_of_hash.length 
    table_GOO << array_of_hash[i].fetch(:GOO)
    table_MMM << array_of_hash[i].fetch(:MMM)
    table_ADBE << array_of_hash[i].fetch(:ADBE)
    table_EA << array_of_hash[i].fetch(:EA)
    table_BA << array_of_hash[i].fetch(:BA)
    table_KO << array_of_hash[i].fetch(:KO)
    table_XOM << array_of_hash[i].fetch(:XOM)
    table_GPS << array_of_hash[i].fetch(:GPS)
    table_MCD << array_of_hash[i].fetch(:MCD)
    table_DIS << array_of_hash[i].fetch(:DIS)
    table_CRM << array_of_hash[i].fetch(:CRM)
    table_JNJ << array_of_hash[i].fetch(:JNJ)
  end

  trader_du_dimanche(table_GOO)
  trader_du_dimanche(table_MMM)
  trader_du_dimanche(table_ADBE)
  trader_du_dimanche(table_EA)
  trader_du_dimanche(table_BA)
  trader_du_dimanche(table_KO)
  trader_du_dimanche(table_XOM)
  trader_du_dimanche(table_GPS)
  trader_du_dimanche(table_MCD)
  trader_du_dimanche(table_DIS)
  trader_du_dimanche(table_CRM)
  trader_du_dimanche(table_JNJ)
end 

#trader_du_lundi(hash_week)

####################### COMPTER LES MOTS ##########################

dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

def jean_michel_data(corpus,dictionnaire)
  my_corpus = []
  my_result_words = []
  my_result_number = []
  number_of_word = 0
  is_it_ok = false
  
  corpus.downcase.each_byte { |letter| my_corpus << letter } #On transforme lettre en ASCII

  my_corpus.keep_if { |ascii| (ascii == 32) || ((ascii < 123) && (ascii > 96)) } #On retire les éléments inutiles
  
  my_corpus.each { |ascii| my_result_words << ascii.chr } #On transforme ASCII en lettre 
  
  #puts dictionnaire

  my_result_words = my_result_words.join("").split(" ")

  #puts my_result_words[0][2]

  

=begin
  for i in 0...my_result_words.length
    for j in 0...my_result_words[i].length
      puts my_result_words[i][j]
      puts dictionnaire[i][j]
      if my_result_words[i][j] == dictionnaire[i][j]
        is_it_ok == true
        #puts "prout"
      elsif my_result_words[i][j] == " " && is_it_ok == true
        number_of_word += 1
        #puts "caca"
      else
        is_it_ok ==false
        #puts "pipi"
      end
      my_result_number << number_of_word
      number_of_word = 0
      is_it_ok = false
    end
  end
=end        

=begin
  for i in 0..my_result_words.length
    for j in 0..dictionnaire.length
      if my_result_words[i] == dictionnaire[i]
        is_it_ok = true
      end
      if my_result_words[i + 1] == " " && is_it_ok == true
        number_of_word += 1
      else
        is_it_ok = false
      end
      #puts number_of_word
    end
    my_result_number << number_of_word
    number_of_word = 0
    is_it_ok = false
  end
=end

  my_result_words = my_result_words.join("").split(" ") #On refait la phrase correctement, on refait un tableau avec les espaces comme sépare

=begin
  for i in 0..my_result_words.length
    my_result_number << 0  
    dictionnaire.each do |dico_word|
      if my_result_words[i] == dico_word
        my_result_number[i] += 1
      end
    end
  end
=end

  result = Hash.new
  for i in 0..my_result_words.length - 1
    result.store(my_result_words[i],my_result_number[i])
  end
  puts result

end

#jean_michel_data("Howdy partner, sit down! How's it going?",dictionary)
import os


def add_test_numbers(name_of_file):
    
    path = os.getcwd()
    print(path)
    
    test_count = 0
    
    replaced_content = ""
    
    with open(path + "/" + name_of_file, 'r') as file:
        lines = file.readlines()
        for line in lines:
            if line[0] == '1' or line[0] == '0':
                test_count +=1 
                new_line = line.replace(line, line +  '//' +str(test_count))
                replaced_content += new_line
                
            else:
                replaced_content += line
            
    file.close()
    
    with open(path + '/' + name_of_file, 'w') as new_file:
        new_file.write(replaced_content)


add_test_numbers('amount_to_return_testVectors.txt') 

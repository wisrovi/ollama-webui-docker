Poner el archivo en alguna ruta identifiable, por ejemplo:
/home/wrodriguez/miniconda3/

Luego crear un alias con:
nano ~/.zshrc

al final del archivo pegar:
alias gemini='sh /home/wrodriguez/miniconda3/gemini_question.sh'


Luego es necesario reiniciar el zsh con:
source ~/.zshrc


con esto ya se puede probar el gemini, por ejemplo:
gemini "Cual es la capital de francia?"

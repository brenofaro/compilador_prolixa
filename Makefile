JAVA=java
JAVAC=javac
SABLECC_JAR=lib/sablecc.jar
SRC=src/prolixa
BIN=bin

# Regra para rodar o SableCC se dirs não existirem
$(SRC)/analysis $(SRC)/lexer $(SRC)/node $(SRC)/parser:
	$(JAVA) -classpath $(SABLECC_JAR) org.sablecc.sablecc.SableCC src/prolixa.sable

#Alvo principal: garante que o SableCC rodou, compila e copia os recursos
all: $(SRC)/analysis $(SRC)/lexer $(SRC)/node $(SRC)/parser
	@mkdir -p $(BIN)
	$(JAVAC) -d $(BIN) $(shell find $(SRC) -name "*.java")
	@mkdir -p $(BIN)/prolixa/lexer
	@mkdir -p $(BIN)/prolixa/parser
	@cp $(SRC)/lexer/lexer.dat $(BIN)/prolixa/lexer/
	@cp $(SRC)/parser/parser.dat $(BIN)/prolixa/parser/

# Limpa só o que é gerado
clean:
	rm -rf $(SRC)/analysis $(SRC)/lexer $(SRC)/node $(SRC)/parser
	rm -rf $(BIN)

# Executa o programa
run: all
	$(JAVA) -cp $(BIN) prolixa.Main

# Limpa os arquivos antigos e executa o programa
runb: clean all
	$(JAVA) -cp $(BIN) prolixa.Main

# Limpa os arquivos antigos e executa o programa
runbp: clean all
	$(JAVA) -cp $(BIN) prolixa.MainParser

.PHONY: all clean run runb

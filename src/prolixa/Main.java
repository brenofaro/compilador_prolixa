package prolixa;
import prolixa.lexer.*;
import prolixa.parser.*;
import prolixa.lexer.*;
import prolixa.node.*;
import java.io.*;

public class Main
{
    public static void main(String[] args)
    {
        try
        {
            String arquivo = "codFonte/codFonte.prlx";

            Lexer lexer =
                    new Lexer(
                            new PushbackReader(
                                    new FileReader(arquivo), 1024));
            Parser p = new Parser(lexer); 
            
            Start tree = p.parse();
            //Imprime árvore na saída padrão
            tree.apply(new ASTPrinter());
            //Imprime árvore em interface gráfica
            //tree.apply(new ASTDisplay());

        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
    }
}
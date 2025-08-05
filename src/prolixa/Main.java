package prolixa;
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
            Token token;
            while(!((token = lexer.next()) instanceof EOF)) {
            	if (token.getClass() != TVazio.class) { // If para não exibir os tokens vazios
                System.out.println(token.getClass());
                System.out.println(" ( "+token.toString()+")");
            	}
            }
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
    }
}
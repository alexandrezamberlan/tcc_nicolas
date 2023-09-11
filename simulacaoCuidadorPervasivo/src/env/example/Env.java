package example;

// Environment code for project simulacaoCuidadorPervasivo

import jason.asSyntax.*;
import jason.environment.*;
import jason.asSyntax.parser.*;

import java.util.Random;
import java.util.logging.*;

public class Env extends Environment {

    private Logger logger = Logger.getLogger("simulacaoCuidadorPervasivo."+Env.class.getName());


    public String gerarTurno() {
        Random gerador = new Random();
        switch (gerador.nextInt(4)) {
            case 0:
                return "turno(manha)";
            case 1:
                return "turno(tarde)";
            case 2:
                return "turno(noite)";
            case 3:
                return "turno(madrugada)";        
            default:
                break;
        }
        return "";
    }

    public String gerarEventoExterno() {
        Random gerador = new Random();
        switch (gerador.nextInt(4)) {
            case 0:
                return "evento(chuva)";
            case 1:
                return "evento(barulho)";
            case 2:
                return "evento(visita)";
            case 3:
                return "evento(nenhum)";        
            default:
                break;
        }
        return "";
    }

    /** Called before the MAS execution with the args informed in .mas2j */
    @Override
    public void init(String[] args) {
        super.init(args);
        try {
            addPercept(ASSyntax.parseLiteral(gerarTurno()));
            addPercept(ASSyntax.parseLiteral(gerarEventoExterno()));

        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean executeAction(String agName, Structure action) {
        logger.info("executing: "+action+", but not implemented!");
        if (true) { // you may improve this condition
             informAgsEnvironmentChanged();
        }
        return true; // the action was executed with success
    }

    /** Called before the end of MAS execution */
    @Override
    public void stop() {
        super.stop();
    }
}

import Html exposing (text)

type alias Env = (String -> Int)

-- Zero
zero : Env
zero = \ask -> 0



-- Operacoes

type Exp = Consta String
         | Num Int
         | Var String
         
         -- Matematicas
         | Add Exp Exp
         | Sub Exp Exp
         | Div Exp Exp
         | Mul Exp Exp
         | Modu Exp Exp
         | El Exp Exp
         
         --logicas
         | Ma Exp Exp
         | Me Exp Exp
         | Igual Exp Exp
         

         
type Prog = Attr String Exp
          | If Exp Prog Prog
          | While Exp Prog
          | DefConst String Exp
          | Seq Prog Prog   
 
 
 
evalExp : Exp -> Env -> Int
evalExp exp env =
    case exp of
        
        Num x               -> x
        Var variavel            -> (env variavel)
        Consta constante        -> (env constante)
        
        -- Operacpes matematicas
        
        Add exp1 exp2       -> (evalExp exp1 env) + (evalExp exp2 env)
        Sub exp1 exp2       -> (evalExp exp1 env) - (evalExp exp2 env)        
        Mul exp1 exp2     -> (evalExp exp1 env) * (evalExp exp2 env)
        Div exp1 exp2       -> (evalExp exp1 env) // (evalExp exp2 env)
        Modu exp1 exp2       -> (evalExp exp1 env) % (evalExp exp2 env)
        El x e   -> (evalExp x env) ^ (evalExp e env)
        
        --Operacoes logicas
        
        Ma exp1 exp2        ->
                if (evalExp exp1 env) > (evalExp exp2 env) then
                    1
                else
                    0
        Me exp1 exp2        ->
                if (evalExp exp1 env) < (evalExp exp2 env) then
                    1
                else
                    0
        Igual exp1 exp2        ->
                if (evalExp exp1 env) == (evalExp exp2 env) then
                    1
                else
                    0
         
 
 
evalProg : Prog -> Env -> Env
evalProg s env =
    case s of
        Seq s1 s2       ->
            (evalProg s2 (evalProg s1 env))
        Attr variavel exp    ->
            let
                valor = (evalExp exp env)
            in
                \ask -> if ask == variavel then valor else (env ask)        
        If cond ex1 ex2   ->
                if (evalExp cond env) /= 0 then
                    (evalProg ex1 env)
                else
                    (evalProg ex2 env)
        While condicao c   ->
                if (evalExp condicao env) == 0 then
                    env
                else
                    (evalProg (Seq c s) env)
                    
        DefConst constante exp ->
            let
                val = (evalExp exp env)
            in
                \ask -> if ask == constante then
                                val
                            else
                                (env ask)
----------------------------------------------------------------------------------------------------------------
lang : Prog -> Int
lang p = ((evalProg p zero) "ret")

p1 : Prog
p1 = (Attr "ret" (Add (Num 21) (Num 9)))

p2 : Prog
p2 = Seq
        (Attr "x"   (Num 15))
        (Attr "ret" (Sub (Var "x") (Num 9)))
-- Maior        
p4 : Prog
p4 = (If (Ma (Num 15) (Num 10)) (Attr "ret" (Num 1)) ((Attr "ret" (Num 0))))
-- Menor
p5 : Prog
p5 = (If (Me (Num 15) (Num 10)) (Attr "ret" (Num 1)) ((Attr "ret" (Num 0))))


----------------------------------------------------------------------------------------------------------------------------------

main = text (toString (lang p1))

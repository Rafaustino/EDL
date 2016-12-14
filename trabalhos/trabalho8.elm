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
                    
       -- DefConst constante exp ->
         --   let
         --       val = (evalExp exp env)
         --   in
         --       \ask -> if ask == constante then
           --                     val
            --                else
              --                  (env ask)
----------------------------------------------------------------------------------------------------------------
lang : Prog -> Int
lang p = ((evalProg p zero) "ret")
   
  ---------- TESTES ------------------ TESTES ---------------------------TESTES---------------------------------------------
   
   
p1 : Prog
p1 = (Attr "ret" (Add (Num 21) (Num 9)))

-- Atribuicao
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

-- While
--Teste onde conto o numero de cada passo while e multiplico por 5
p6: Prog
p6 =    (Seq
                (Seq
                    (Attr "i" (Num 100))
                    (While (Var "i")
                        (Seq
                            (Attr "i" (Sub (Var "i") (Num 1)))
                            (Attr "x" (Add (Var "x")(Mul (Num 1)(Num 5))))
                        )
                    )
                )
                (Attr "ret" (Var "x"))
            )
            
            
-- Operacoes matemticas            
p7: Prog
p7 = (Attr "ret" (Sub (Num 10) (Num 9)))


p8  : Prog
p8= (Attr "ret" (Mul (Num 2) (Num 9)))

p9 : Prog
p9 = (Attr "ret" (Div (Num 30) (Num 10)))

p10 : Prog
p10 = (Attr "ret" (El (Num 2) (Num 3)))
----------------------------------------------------------------------------------------------------------------------------------

main = text (toString (lang p6))

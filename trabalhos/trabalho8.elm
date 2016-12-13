import Html exposing (text)

type alias Env = (String -> Int)
zero : Env
zero = \ask -> 0

type Exp = Add Exp Exp
         | Num Int
         | Var String
         
type Prog = Attr String Exp
          | Seq Prog Prog         
          
evalExp : Exp -> Env -> Int
evalExp exp env =
    case exp of
        Add exp1 exp2  -> (evalExp exp1 env) + (evalExp exp2 env)
        
        Num v          -> v
        Var var        -> (env var)
        
evalProg : Prog -> Env -> Env
evalProg s env =
    case s of
        Seq s1 s2 ->
            (evalProg s2 (evalProg s1 env))
        Attr var exp ->
            let
                val = (evalExp exp env)
            in
                \ask -> if ask==var then val else (env ask)
----------------------------------------------------------------------------------------------------------------
lang : Prog -> Int
lang pz = ((evalProg pz zero) "ret")

p1 : Prog
p1 = (Attr "ret" (Add (Num 21) (Num 9)))

p2 : Prog
p2 = Seq
        (Attr "x"   (Num 15))
        (Attr "ret" (Add (Var "x") (Num 9)))
        
              
-------------------------------------------------------------------------------------------------------------         
type Exp2 = Sub Exp Exp
            | Num2 Int
            | Var2 String
            
type Prog2 = Attr2 String Exp2
          | Seq2 Prog2 Prog2            
          
evalExp2 : Exp2 -> Env -> Int
evalExp2 exp2 env = 
      case exp2 of
        Sub exp3 exp4   -> (evalExp exp3 env) - (evalExp exp4 env)
        
        Num2 v2          -> v2
        Var2 var2        -> (env var2)
        
        
evalProg2 : Prog2 -> Env -> Env
evalProg2 s env =
    case s of
        Seq2 s3 s4 ->
            (evalProg2 s4 (evalProg2 s3 env))
        Attr2 var2 exp2 ->
            let
                val = (evalExp2 exp2 env)
            in
                \ask -> if ask==var2 then val else (env ask)
-----------------------------------------------------------------------------------------------------------------                
lang2 : Prog2 -> Int
lang2 sz = ((evalProg2 sz zero) "ret")

s1 : Prog2
s1 = (Attr2 "ret" (Sub (Num 11) (Num 9)))

s2 : Prog2
s2 = Seq2
        (Attr2 "x"   (Num2 10))
        (Attr2 "ret" (Sub (Var "x") (Num 9)))
  
-----------------------------------------------------------------------------------------------------------------            
type Exp3 = Mul Exp Exp
            | Num3 Int
            | Var3 String
            
type Prog3 = Attr3 String Exp3
          | Seq3 Prog3 Prog3            
          
evalExp3 : Exp3 -> Env -> Int
evalExp3 exp3 env = 
      case exp3 of
        Mul exp5 exp6   -> (evalExp exp5 env) * (evalExp exp6 env)
        
        Num3 v3          -> v3
        Var3 var3        -> (env var3)

evalProg3: Prog3 -> Env -> Env
evalProg3  s env =
    case s of
        Seq3 s5 s6 ->
            (evalProg3 s6 (evalProg3 s5 env))
        Attr3 var3 exp3 ->
            let
                val = (evalExp3 exp3 env)
            in
                \ask -> if ask==var3 then val else (env ask)
------------------------------------------------------------------------------------------------------------------
lang3 : Prog3 -> Int
lang3 vz = ((evalProg3 vz zero) "ret")

v1 : Prog3
v1 = (Attr3 "ret" (Mul (Num 11) (Num 9)))

v2 : Prog3
v2 = Seq3
        (Attr3 "x"   (Num3 10))
        (Attr3 "ret" (Mul (Var "x") (Num 9)))

------------------------------------------------------------------------------------------------------------------
type Exp4 = Div Exp Exp
            | Num4 Int
            | Var4 String

type Prog4 = Attr4 String Exp4
          | Seq4 Prog4 Prog4
      
evalExp4 : Exp4 -> Env -> Int
evalExp4 exp4 env = 
      case exp4 of
        Div exp7 exp8   -> (evalExp exp7 env) // (evalExp exp8 env)
        
        Num4 v4          -> v4
        Var4 var4       -> (env var4)

evalProg4: Prog4 -> Env -> Env
evalProg4  s env =
    case s of
        Seq4 s7 s8 ->
            (evalProg4 s8 (evalProg4 s7 env))
        Attr4 var4 exp4 ->
            let
                val = (evalExp4 exp4 env)
            in
                \ask -> if ask==var4 then val else (env ask)
--------------------------------------------------------------------------------------------------------------------------------- 
lang4 : Prog4 -> Int
lang4 dz = ((evalProg4 dz zero) "ret")

d1 : Prog4
d1 = (Attr4 "ret" (Div (Num 20) (Num 5)))

d2 : Prog4
d2 = Seq4
        (Attr4 "x"   (Num4 10))
        (Attr4 "ret" (Div (Var "x") (Num 2)))
 
----------------------------------------------------------------------------------------------------------------------------------

--main = text (toString (lang p1))
--main = text (toString (lang p2))
--main = text (toString (lang2 s1))
--main = text (toString (lang2 s2))
--main = text (toString (lang3 v1))
--main = text (toString (lang3 v2))
--main = text (toString (lang4 d1))
main = text (toString (lang4 d2))

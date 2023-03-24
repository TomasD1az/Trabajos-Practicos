module FileSystem  ( FileSystem, nuevoF, etiquetasF, temasF, agregarF, filtrarF )
where

import Tipos
import Tema 

data FileSystem = FS [Etiqueta] [Tema] deriving (Eq)

instance Show FileSystem
     where show (FS etiquetas temas) = "FileSystem\n" ++ "| Etiquetas: " ++ show etiquetas ++ "\n| Temas:\n" ++ printT temas

printT = foldl (\fold each -> fold ++ show each ++ "\n") "" 

nuevoF :: FileSystem
nuevoF = FS [] [] 

etiquetasF :: FileSystem -> [ Etiqueta ]
etiquetasF (FS etiquetas _ ) = etiquetas 

temasF :: FileSystem -> [ Tema ]
temasF (FS _ temas) = temas 

agregarF :: Tema -> FileSystem -> FileSystem
agregarF tema (FS etiquetas temas) = FS (etiquetas ++ etiquetasT tema) (tema : temas)

filtrarF :: Etiqueta -> FileSystem -> [ Tema ]
filtrarF etiqueta (FS etiquetas temas) = foldr (\each fold-> if etiqueta `elem` etiquetasT each then each:fold else fold) [] temas

tema1 = nuevoT "cancion1" "caca1"
temazo = agregarT "Rock" tema1

tema2 = nuevoT "cancion2" "caca2"
temazono = agregarT "Rock" tema2

filesys1 = FS [] [temazo, temazono]
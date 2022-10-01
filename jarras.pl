% Jarra 1 possui capacidade de 4 litros
% Jarra 2 possui capacidade de 3 litros

% Estados são representados como objetivo(J1, J2),
% onde J1 e J2 são as quantidades de água em cada jarra

% ============== (a) - Estados finais ==============

% Estado inicial
objetivo(0, 0).

% O estado final é qualquer um em que o jarro 1 possua
% 2 unidades de água
objetivo(2, _).

% ============== (b) - Transições ==============

% Transições / ações possíveis:
% Encher completamente as jarras (encher1, encher2)
% Esvaziar completamente as jarras (esvaziar1, esvaziar2)
% Passar a água de uma jarra para outra (passar12, passar21)

acao(encher1, objetivo(_, J2), objetivo(4, J2)).
acao(encher2, objetivo(J1, _), objetivo(J1, 3)).
acao(esvaziar1, objetivo(_, J2), objetivo(0, J2)).
acao(esvaziar2, objetivo(J1, _), objetivo(J1, 0)).

acao(passar12, objetivo(J1, J2), objetivo(0, X)):- % Jarra 1 vazia
	X is J1 + J2, 
	X =< 3.
acao(passar12, objetivo(J1, J2), objetivo(Y, 3)):- % Jarra 2 cheia
	X is J1 + J2, 
	X > 3, 
	Y is X - 3.

acao(passar21, objetivo(J1, J2), objetivo(X, 0)):- % Jarra 2 vazia
	X is J1 + J2, 
	X =< 4.
acao(passar21, objetivo(J1, J2), objetivo(4, Y)):- % Jarra 1 cheia
	X is J1 + J2, 
	X > 4, 
	Y is X - 4. 

% ============== (c) - Estados vizinhos ==============

% Dada uma configuração de jarras N, retorna todas as
% configurações possíveis de transições de estado

vizinho(N, FilhosN) :-
	findall(Estado, acao(_, N, Estado), FilhosN).
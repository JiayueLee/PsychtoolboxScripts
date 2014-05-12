% ContrastTwo Version 1.0 written by Reza Farajian September 2010
% For modulating the contrast of a spot of green light.
% Written for a dual monitor SXGA primary (1280x1024) and
% SVGA secondary (800x600) setup


% Set screen
whichScreen = 0;
Screen('Preference', 'VisualDebuglevel', 3);
window = Screen(whichScreen,'OpenWindow');
HideCursor;

KbName('UnifyKeyNames');

% Set brightness variables.
white = WhiteIndex(window); % pixel value for white
black = BlackIndex(window); % pixel value for black
StimBright = 64;
BackBright = 0;

% Set keys.
escapeKey = KbName('ESCAPE');
one = KbName ('1');
two = KbName ('2');
three = KbName ('3');
four = KbName ('4');
five = KbName ('5');
six = KbName ('6');
seven = KbName ('7');
eight = KbName ('8');
zero = KbName ('0');
Q = KbName ('q');
W = KbName ('w');
E = KbName ('e');
R = KbName ('r');
T = KbName ('t');
Y = KbName ('y');
U = KbName ('u');
I = KbName ('i');
O = KbName ('o');
P = KbName ('p');
A = KbName ('a');
S = KbName ('s');
D = KbName ('d');
F = KbName ('f');
G = KbName ('g');
H = KbName ('h');
J = KbName ('j');
K = KbName ('k');
L = KbName ('l');

% Center is 1680 and 300
% Initial circle size
LeftPosition=1672;
RightPosition=1688;
TopPosition=292;
BottomPosition=308;

% Q62.5, W125, E187.5, R250, T375, Y500, U750, I1000, O1500, P2000
% on our 4x microscope objective (units are in microns).

% Initial dark screen until key press
Screen(window, 'FillRect', black);
Screen(window, 'Flip');
KbWait;

ListenChar(2);

while 1
    Screen(window, 'FillRect',[0 BackBright 0]);
    Screen(window, 'Flip');
    WaitSecs(4);

    Screen(window,'FillOval',[0 StimBright 0],...
        [LeftPosition TopPosition RightPosition BottomPosition]);
    Screen(window, 'Flip');
    WaitSecs(2);
    
    [keyIsDown, seconds, keyCode] = KbCheck;
   
    if keyIsDown
        if keyCode(Q)
            TopPosition = 292;
            BottomPosition = 308;
            LeftPosition = 1672;
            RightPosition = 1688;
                        
        elseif keyCode(W)
            TopPosition = 281;
            BottomPosition = 319;
            LeftPosition = 1661;
            RightPosition = 1699;
                    
        elseif keyCode(E)
            TopPosition = 272;
            BottomPosition = 328;
            LeftPosition = 1652;
            RightPosition = 1708;
                    
        elseif keyCode(R)
            TopPosition = 264;
            BottomPosition = 336;
            LeftPosition = 1644;
            RightPosition = 1716;    
            
        elseif keyCode(T)
            TopPosition = 243;
            BottomPosition = 353;
            LeftPosition = 1623;
            RightPosition = 1733;   
            
        elseif keyCode(Y)
            TopPosition = 224;
            BottomPosition = 376;
            LeftPosition = 1604;
            RightPosition = 1756; 
            
        elseif keyCode(U)
            TopPosition = 184;
            BottomPosition = 416;
            LeftPosition = 1564;
            RightPosition = 1796; 
                   
        elseif keyCode(I)
            TopPosition = 142;
            BottomPosition = 458;
            LeftPosition = 1522;
            RightPosition = 1838;     
                        
        elseif keyCode(O)
            TopPosition = 68;
            BottomPosition = 532;
            LeftPosition = 1448;
            RightPosition = 1912; 
                        
        elseif keyCode(P)
            TopPosition = -16;
            BottomPosition = 616;
            LeftPosition = 1364;
            RightPosition = 1996;      
        
       
        elseif keyCode(A)
              BackBright = 0;
              
        elseif keyCode(S)
              BackBright = 32;
              
        elseif keyCode(D)
              BackBright = 64;
              
        elseif keyCode(F)
              BackBright = 96;
              
        elseif keyCode(G)
              BackBright = 128;
              
        elseif keyCode(H)
              BackBright = 160;
              
        elseif keyCode(J)
              BackBright = 192;
              
        elseif keyCode(K)
              BackBright = 224;
              
        elseif keyCode(L)
              BackBright = 255;
                         
           
        elseif keyCode(zero)
            StimBright = 0;
            
        elseif keyCode(one)
            StimBright = 32;
            
        elseif keyCode(two)
            StimBright = 64;
        
        elseif keyCode(three)
            StimBright = 96;
                
        elseif keyCode(four)
            StimBright = 128;
        
        elseif keyCode(five)
            StimBright = 160;
        
        elseif keyCode(six)
            StimBright = 192;
        
        elseif keyCode(seven)
            StimBright = 224;
        
        elseif keyCode(eight)
            StimBright = 255;
            
                         
        elseif keyCode(escapeKey)
                break;
        end
   end
        
end;


Screen('CloseAll');
ListenChar;
ShowCursor;


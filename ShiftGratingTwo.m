% ShiftGratingTwo Version 1.2 written by Reza Farajian September 2010
% Written for a dual monitor SXGA primary (1280x1024) and
% SVGA secondary (800x600) setup
% With a slow central spot


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
GratingBright = 64;

% Set keys.
rightKey = KbName('RightArrow');
leftKey = KbName('LeftArrow');
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

% Q=62.5, W=125, E=187.5, R=250, T=375, Y=500, U=750, I=1000, O=1500, P=2000
% on our 4x objective (units in microns)

% Initial rectangle position variables
BarWidth = 60;
StartLeftCorner = 1280;
StartRightCorner = StartLeftCorner + BarWidth;

% Initial dark screen until key press
Screen(window, 'FillRect', black);
Screen(window, 'Flip');
KbWait;

SpotON = 0;

ListenChar(2);

while 1
    
    Screen(window, 'FillRect', black);
    Screen(window, 'Flip');
    
    if StartLeftCorner == 1280
        StartLeftCorner = 1280 + BarWidth;
        StartRightCorner = StartLeftCorner + BarWidth;
    else
        StartLeftCorner = 1280;
        StartRightCorner = 1280 + BarWidth;
    end;
           
    LeftCorner = StartLeftCorner;
    RightCorner = StartRightCorner;
              
    while RightCorner < 2200
        Screen(window, 'FillRect', [0 GratingBright 0],...
            [LeftCorner 0 RightCorner 1050]);
        LeftCorner = LeftCorner + BarWidth * 2;
        RightCorner = RightCorner + BarWidth * 2;
    end;
           
    switch SpotON
        case {0,1}
            Screen(window,'FillOval',[0 0 0],...
                [LeftPosition TopPosition RightPosition BottomPosition]);
            SpotON = SpotON + 1;
        case {2,3}
            Screen(window,'FillOval',[0 StimBright 0],...
                [LeftPosition TopPosition RightPosition BottomPosition]);
            SpotON = SpotON + 1;
            if SpotON == 4
                SpotON = 0;
            end;
    end;
            
    Screen(window, 'Flip');
    WaitSecs(3);
            
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
              GratingBright = 0;
              
        elseif keyCode(S)
              GratingBright = 32;
              
        elseif keyCode(D)
              GratingBright = 64;
              
        elseif keyCode(F)
              GratingBright = 96;
              
        elseif keyCode(G)
              GratingBright = 128;
              
        elseif keyCode(H)
              GratingBright = 160;
              
        elseif keyCode(J)
              GratingBright = 192;
              
        elseif keyCode(K)
              GratingBright = 224;
              
        elseif keyCode(L)
              GratingBright = 255;    
        

        elseif keyCode(rightKey)
            BarWidth = BarWidth + 10;
            
        elseif keyCode(leftKey) && BarWidth > 11

            BarWidth = BarWidth - 10;
                        
        
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


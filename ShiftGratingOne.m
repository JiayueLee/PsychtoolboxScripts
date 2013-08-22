% ShiftGratingOne Version 1.2 written by Reza Farajian September 2010
% Written for a single WSXGA+ (1680x1050) monitor setup
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

% Set keys.
rightKey = KbName('RightArrow');
leftKey = KbName('LeftArrow');
upKey = KbName('UpArrow');
downKey = KbName('DownArrow');
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

% Initial circle size
LeftPosition = 790;
RightPosition = 890;
TopPosition = 475;
BottomPosition = 575;

% Initial rectangle position variables
BarWidth = 120;
StartLeftCorner = 0;
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
    
    if StartLeftCorner == 0
        StartLeftCorner = BarWidth;
        StartRightCorner = StartLeftCorner + BarWidth;
    else
        StartLeftCorner = 0;
        StartRightCorner = BarWidth;
    end;
           
    LeftCorner = StartLeftCorner;
    RightCorner = StartRightCorner;
              
    while RightCorner < 1700
        Screen(window, 'FillRect', [0 StimBright 0],...
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
    WaitSecs(2);
            
    [keyIsDown, seconds, keyCode] = KbCheck;
   
    if keyIsDown
        if keyCode(upKey) && TopPosition > 0
            TopPosition = TopPosition - 100;
            BottomPosition = BottomPosition + 100;
            LeftPosition = LeftPosition - 100;
            RightPosition = RightPosition + 100;
                        
        elseif keyCode(downKey) && TopPosition < 475
            TopPosition = TopPosition + 100;
            BottomPosition = BottomPosition - 100;
            LeftPosition = LeftPosition + 100;
            RightPosition = RightPosition - 100;
            
        elseif keyCode(rightKey)
            BarWidth = BarWidth + 100;
            
        elseif keyCode(leftKey) && BarWidth > 100
            BarWidth = BarWidth - 100;
                        
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


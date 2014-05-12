% Contrast One Version 1.0 written by Reza Farajian September 2010
% For projecting and modulating the contrast of a spot of green light.
% Written for a single WSXGA+ monitor setup


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
upKey = KbName('UpArrow');
downKey = KbName('DownArrow');
leftKey = KbName ('LeftArrow');
rightKey = KbName ('RightArrow');
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

% Initial dark screen until key press
Screen(window, 'FillRect', black);
Screen(window, 'Flip');
KbWait;

ListenChar(2);

while 1
    Screen(window, 'FillRect',[0 BackBright 0]);
    Screen(window, 'Flip');
    WaitSecs(1);

    Screen(window,'FillOval',[0 StimBright 0],...
        [LeftPosition TopPosition RightPosition BottomPosition]);
    Screen(window, 'Flip');
    WaitSecs(1);
    
    [keyIsDown, seconds, keyCode] = KbCheck;
   
    if keyIsDown
        if keyCode(upKey)&& TopPosition > 0
            TopPosition = TopPosition - 100;
            BottomPosition = BottomPosition + 100;
            LeftPosition = LeftPosition - 100;
            RightPosition = RightPosition + 100;
                        
        elseif keyCode(downKey) && TopPosition < 475
            TopPosition = TopPosition + 100;
            BottomPosition = BottomPosition - 100;
            LeftPosition = LeftPosition + 100;
            RightPosition = RightPosition - 100;
            
        elseif keyCode(leftKey)
            BackBright = BackBright - 32;
            
        elseif keyCode(rightKey)
            BackBright = BackBright + 32;
            
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


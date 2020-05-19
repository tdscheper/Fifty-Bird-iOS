--[[
    TitleScreenState Class
    
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The TitleScreenState is the starting screen of the game, shown on startup. It should
    display "Press Enter" and also our highest score.
]]

TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:enter(params)
    self.highScore = params.highScore
end

function TitleScreenState:update(dt)
    if love.mouse.wasPressed(1) then
        gStateMachine:change('countdown', {highScore = self.highScore})
    end
end

function TitleScreenState:render()
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Fifty Bird', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Tap to Play', 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('High Score: ' .. tostring(self.highScore), 0, VIRTUAL_HEIGHT - 64, VIRTUAL_WIDTH, 'center')
end

--Screen Resolution
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720



function love.load()

--Set the speed of paddle

  paddleSpeed = 255

  paddle1 = {}
  paddle1.y = 30
  paddle1.score = 0

  paddle2 = {}
  paddle2.y = 30
  paddle2.score = 0

--Setting the window
  love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
    fullscreen = false,
    resizable = false,
    vsync = true
  })


end


function love.update(dt)

  --First Paddle Control Movement
  if love.keyboard.isDown('w') then

  paddle1.y = math.max(0, paddle1.y + -paddleSpeed * dt)

  end

  if love.keyboard.isDown('s') then
    --body...

    paddle1.y = math.min(650, paddle1.y + paddleSpeed * dt)
  end

  --Second Paddle Control Movement
  if love.keyboard.isDown('up') then
    --body...

    paddle2.y = math.max(0, paddle2.y + -paddleSpeed * dt)

  end

  if love.keyboard.isDown('down') then
    --body...

    paddle2.y = math.min(650, paddle2.y + paddleSpeed * dt)
  end


end

function love.draw()

  --Set background Color
  love.graphics.clear(0.1490196078431373,0.1490196078431373,0.1490196078431373)


  --First paddle graphic
  love.graphics.rectangle('fill', 10 ,paddle1.y, 30, 80)

  --First paddle graphic
  love.graphics.rectangle('fill', 1235, paddle2.y, 30, 80)

  --Ball graphic, set in center
  love.graphics.circle('fill', WINDOW_WIDTH / 2 - 2, WINDOW_HEIGHT / 2 - 2, 10)

end

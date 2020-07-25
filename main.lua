WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

function love.load()

  paddleSpeed = 255

  paddle1 = {}
  paddle1.y = 30
  paddle1.score = 0

  love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
    fullscreen = false,
    resizable = false,
    vsync = true
  })


end


function love.update(dt)
  if love.keyboard.isDown('w') then

  paddle1.y = math.max(0, paddle1.y + -paddleSpeed * dt)

  end

  if love.keyboard.isDown('s') then
    --body...

    paddle1.y = math.min(650, paddle1.y + paddleSpeed * dt)
  end


end

function love.draw()

  love.graphics.rectangle('fill', 10 ,paddle1.y, 30, 80)

  

end

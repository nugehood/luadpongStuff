
--Screen Resolution
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720



function love.load()

  --Make the world using gravity and velocity, etc
  love.physics.setMeter(WINDOW_HEIGHT)
  --Create world for the physics stuff
  world = love.physics.newWorld(0, 1*WINDOW_HEIGHT, true)



--Set the speed of paddle

  paddleSpeed = 255

  paddle1 = {}
  paddle1.y = 30
  paddle1.score = 0

  paddle2 = {}
  paddle2.y = 30
  paddle2.score = 0

  --Ball table
  ball = {}
  --Create the ball body/Rigidbody2D(Kebanyakan pake unity hehehe)
  ball.body = love.physics.newBody(world, WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2, "dynamic")
  --Create 2DCIRCLE collider, by setting the radius
  ball.shape =  love.physics.newCircleShape(10)
  --Clamp or join rigidbody and collider together
  ball.fixture = love.physics.newFixture(ball.body, ball.shape, 1)
  --Set the friction, in this case it bounces!
  ball.fixture:setRestitution(0.9)

--Setting the window
  love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
    fullscreen = false,
    resizable = false,
    vsync = true
  })


end


function love.update(dt)
  --Make the world constantly update with deltatime
  world:update(dt)

  --Applying the force to ball body
  ball.body:applyForce(0,0)

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

  --Ball graphic
  love.graphics.circle('fill', ball.body:getX(), ball.body:getY(), ball.shape:getRadius())


end

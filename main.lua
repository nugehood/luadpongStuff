
--Screen Resolution
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720



function love.load()

  font = love.graphics.newFont(100)

  --Make the world using gravity and velocity, etc
  love.physics.setMeter(WINDOW_HEIGHT)
  --Create world for the physics stuff
  world = love.physics.newWorld(0, 1*WINDOW_HEIGHT, true)



--Set the speed of paddle

  paddleSpeed = 255
  BALLSPEED = 2;

  --Objects table containing interactable object
  objects = {}

  --Paddle1/Player1 table
  objects.paddle1 = {}
  --paddle1 score
  objects.paddle1.score = 0
  --paddle1 y axis movement
  objects.paddle1.y = 30
  --paddle1 Rigidbody2D
  objects.paddle1.body = love.physics.newBody(world, 10, objects.paddle1.y, "kinematic")
  --paddle1 collider
  objects.paddle1.shape = love.physics.newRectangleShape(30, 80)
  --Fix paddle1 Rigidbody2D
  objects.paddle1.fixture = love.physics.newFixture(objects.paddle1.body, objects.paddle1.shape, 1)

  --Paddle2/Player2 table
  objects.paddle2 = {}
  --Paddle2 y axis
  objects.paddle2.y =  500
  --Paddle2 score
  objects.paddle2.score = 0
  --Paddle2 Rigidbody2D
  objects.paddle2.body = love.physics.newBody(world, 1235, objects.paddle2.y, "kinematic")
  --Paddle2 collider
  objects.paddle2.shape = love.physics.newRectangleShape(30, 400)
  --Fix paddle2 Rigidbody2D and collider
  objects.paddle2.fixture = love.physics.newFixture(objects.paddle2.body, objects.paddle2.shape, 1)

  --TopOffset table
  objects.ground = {}
  --ground Rigidbody2D
  objects.ground.body = love.physics.newBody(world, 0, WINDOW_HEIGHT/200)
--ground collider
  objects.ground.shape = love.physics.newRectangleShape(9999, 6)
  --ground fix Rigidbody2D and collider
  objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape)

  --BottomOffset table
  objects.ground1 = {}
  --ground1 Rigidbody2D
  objects.ground1.body = love.physics.newBody(world, 0,710)
  --ground1 Rigidbody2D
  objects.ground1.shape = love.physics.newRectangleShape(9999, 6)
  --ground1 fix Rigidbody2D and collider
  objects.ground1.fixture = love.physics.newFixture(objects.ground1.body, objects.ground1.shape)

  --Ball table
  objects.ball = {}
  --Create the ball body/Rigidbody2D(Kebanyakan pake unity hehehe)
  objects.ball.body = love.physics.newBody(world, WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2, "dynamic")
  --Create 2DCIRCLE collider, by setting the radius
  objects.ball.shape =  love.physics.newCircleShape(10)
  --Clamp or join rigidbody and collider together
  objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape, 1)
  --Set the friction, in this case it bounces!
  objects.ball.fixture:setRestitution(1)




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


  objects.ball.body:applyForce(0,1)






  --First Paddle Control Movement
  if love.keyboard.isDown('w') then

  objects.paddle1.body:setY(math.max(0, objects.paddle1.body:getY() + -paddleSpeed * dt))

  end

  if love.keyboard.isDown('s') then
    --body...

    objects.paddle1.body:setY(math.min(650, objects.paddle1.body:getY() + paddleSpeed * dt))
  end

  --Second Paddle Control Movement
  if love.keyboard.isDown('up') then
    --body...

    objects.paddle2.body:setY(math.max(0, objects.paddle2.body:getY() + -paddleSpeed * dt))

  end

  if love.keyboard.isDown('down') then
    --body...

    objects.paddle2.body:setY(math.min(650, objects.paddle2.body:getY() + paddleSpeed * dt))
  end


end

function love.draw()

  --Set background Color
  love.graphics.clear(0.1490196078431373,0.1490196078431373,0.1490196078431373)

  love.graphics.setFont(font)

  love.graphics.print("0",200,20)

  love.graphics.print("0",1000,20)

  --First paddle graphic
  love.graphics.rectangle('fill', 10 ,objects.paddle1.body:getY(), 30, 80)

  --First paddle graphic
  love.graphics.rectangle('fill', 1235, objects.paddle2.body:getY(), 30, 80)

  love.graphics.polygon("fill", objects.ground.body:getWorldPoints(objects.ground.shape:getPoints()))

  love.graphics.polygon("fill", objects.ground1.body:getWorldPoints(objects.ground1.shape:getPoints()))

  --Ball graphic
  love.graphics.circle('fill', objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())



end

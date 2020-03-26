cc.exports.util = {}

local visibleWidth = {}
visibleWidth[800]=1
visibleWidth[960] =1 
visibleWidth[1024]=1.3
visibleWidth[1088]=1.3
visibleWidth[1136]=1.3
visibleWidth[1216]=1.3
visibleWidth[1280]=1.3
visibleWidth[1344]=1.4
visibleWidth[1408]=1.6
visibleWidth[1472]=1.6
visibleWidth[1536]=1.6
visibleWidth[1600]=1.7
visibleWidth[1664]=1.7
visibleWidth[1728]=1.8
visibleWidth[1792]=1.8
visibleWidth[1856]=1.9
visibleWidth[1920]=2.1
visibleWidth[1984]=2.1
visibleWidth[2048]=2.2

local winSizeArray = {}
for i,v in pairs(visibleWidth) do
	table.insert(winSizeArray, i)
end
table.sort(winSizeArray,function ( a,b )
	return a < b
end)

local mScaleNormal = 1
if visibleWidth[display.width] then
	mScaleNormal = visibleWidth[display.width]
else
	local smallWinSize = false
	for i,v in ipairs(winSizeArray) do
		if v >= display.width then
			if winSizeArray[i-1] then
				mScaleNormal = visibleWidth[winSizeArray[i-1]]
			else
				mScaleNormal = visibleWidth[v]
			end
			smallWinSize = true
			break
		end
	end
	if not smallWinSize then
		if display.width > 2560 then
			mScaleNormal = tonumber(string.format("%.1f", 2.4*display.width/2048))
		else
			mScaleNormal = math.ceil((display.width/7-200)/20)/10+1
		end
	end
end

if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_IPHONE and display.width >= 1334  then
	if display.width == 1334 then
		mScaleNormal = mScaleNormal * 1.2
	elseif display.width == 2001 then
	else
		mScaleNormal = mScaleNormal * 1.5
	end
end

local mScaleSmall = mScaleNormal * 0.75

local addMapTimesY = math.ceil((display.width+2*display.height)/((mScaleSmall-0.1)*200))
local addMapTimesX = math.ceil((display.height+0.5*display.width)/((mScaleSmall-0.1)*100))

addMapTimesX = math.ceil(addMapTimesX/2)+1  --每次扩大范围的层数
addMapTimesY = math.ceil(addMapTimesY/2)+1

--从世界坐标转到3d场景坐标
function util.countNodeSpace(x, y, angle )
	local W = display.width
	local H = display.height
	--local x = 255-- 相对于屏幕左下角
	--local y = 592-- 相对于屏幕左下角
	local deltaX = 0-- sprite左下角相对于屏幕左下角
	local deltaY = 0-- sprite左下角相对于屏幕左下角
	-- local angle = m_iAngle

	x = x/W
	y = y/H
	-- deltaX = deltaX/W
	-- deltaY = deltaY/H

	local a = 0.5
	local b = 0.5
	local c = math.sqrt(3) / 2

	local y0 = c * (y - deltaY)/ (c * math.cos(angle * math.pi / 180) - (y - b)* math.sin(angle * math.pi / 180))

	local m = c / (c + y0 * math.sin(angle * math.pi / 180))
	local x0 = (x - a) / m - deltaX + a

	return x0 * W, y0 * H
end
	

function util.getAddMapTimes()
	return addMapTimesX , addMapTimesY
end

function util.getMapSpritePos(posX, posY, coorX, coorY, i, j, offsetX, offsetY)
	local x,y = offsetX or 200, offsetY or 100
	return posX+ ((i- coorX)+(j - coorY))*0.5*x,
		   posY+ 0.5*y*((j-coorY)-(i-coorX))
end
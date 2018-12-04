_SCREEN = {
    HEIGHT = display.contentHeight,
    WIDTH = display.contentWidth 
}
--add to the scrren table the centerpoint of the screen
_SCREEN.CENTER = {
    x = display.contentCenterX,
    y = display.contentCenterY
}

display.setStatusBar(display.HiddentStatusBar)


local widget = require("widget")

local buildings = require("buildings")

local function onRowRender(e)
    local row = e.row
    
    local rowLabel = e.row.params.title
    local rowThumbnail = e.row.params.thumbnail

    row.rowThumbnail = display.newImageRect(rowThumbnail, 60, 60)
    row.rowThumbnail.anchorX = 0
    row.rowThumbnail.x = 12
    row.rowThumbnail.y = row.height * 0.5

    row.rowText = display.newText(rowLabel, 0, 0, display.systemFont, 12)
    row.rowText.anchorX = 0
    row.rowText.x = row.rowThumbnail.width + row.rowThumbnail.x + 12
    row.rowText.y = row.height * 0.5
    row.rowText.fill = {0,0,0,1}

    row:insert(row.rowThumbnail)
    row:insert(row.rowText)
end

local function onRowTouch(e)
    local row = e.target

    if(e.phase == "press") then
        row.rowText.text = row.rowText.text .. " pressed"
    elseif(e.phase == "release") then
        row.rowText.text = row.rowText.text .. " released"
    end

    if(e.phase == "swipeLeft") then
        row:setRowColor({
                default = {0, 80/255, 131/255, 1},
                over = {1, 0, 0, 1}
            })
    elseif (e.phase == "swipeRight") then
        row:setRowColor({
            default = {170/255, 221/255,  221/255, 1},
            over = {1, 0, 0, 1}
         })
    end
end

local tableView = widget.newTableView({
    left = 0,
    top = 0,
    height = _SCREEN.HEIGHT,
    width = _SCREEN.WIDTH,

    onRowRender = onRowRender,
    onRowTouch = onRowTouch
    })

for i = 1, #buildings do
    local building = buildings[i].name
    local thumbnail = buildings[i].thumbnail
    local params = {
        isCategory = false,
        rowHeight = 60,
        rowColor= {
            default = {1,1,1,1},
            over = {1,1,1,1}
    },
        params = {
            title = building,
            thumbnail = thumbnail,
            index = i

        }
    }
    tableView:insertRow(params)
end
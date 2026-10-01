return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.12.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 30,
  height = 16,
  tilewidth = 8,
  tileheight = 8,
  nextlayerid = 2,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "tileset",
      firstgid = 1,
      class = "",
      tilewidth = 8,
      tileheight = 8,
      spacing = 0,
      margin = 0,
      columns = 32,
      image = "tileset.png",
      imagewidth = 256,
      imageheight = 256,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 8,
        height = 8
      },
      properties = {},
      wangsets = {},
      tilecount = 1024,
      tiles = {
        {
          id = 224,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        },
        {
          id = 225,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        },
        {
          id = 226,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        },
        {
          id = 227,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        },
        {
          id = 228,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        },
        {
          id = 256,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        },
        {
          id = 257,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        },
        {
          id = 258,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        },
        {
          id = 259,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        },
        {
          id = 260,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        },
        {
          id = 261,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        },
        {
          id = 289,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        },
        {
          id = 290,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        },
        {
          id = 291,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        },
        {
          id = 292,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        },
        {
          id = 293,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        },
        {
          id = 324,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        },
        {
          id = 325,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 16,
      id = 1,
      name = "Tile Layer 1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 193, 195, 193, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 194, 0, 195, 193, 193, 195, 0, 0, 260, 261, 261, 261, 226, 261, 227, 0, 0, 0, 0, 193, 195, 0, 0, 0, 0, 0, 193,
        225, 226, 226, 261, 226, 261, 226, 261, 226, 261, 226, 228, 258, 326, 293, 290, 290, 229, 226, 261, 261, 261, 226, 227, 0, 0, 0, 225, 226, 226,
        257, 326, 293, 325, 326, 326, 325, 290, 291, 326, 290, 290, 290, 258, 290, 290, 258, 290, 291, 326, 325, 258, 258, 259, 0, 0, 0, 257, 293, 290,
        257, 290, 293, 291, 258, 290, 293, 291, 290, 325, 258, 291, 325, 326, 291, 293, 291, 258, 325, 290, 291, 325, 326, 259, 0, 0, 0, 257, 291, 258
      }
    }
  }
}

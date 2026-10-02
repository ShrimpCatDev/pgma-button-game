return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.12.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 60,
  height = 16,
  tilewidth = 8,
  tileheight = 8,
  nextlayerid = 4,
  nextobjectid = 5,
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
          id = 192,
          animation = {
            {
              tileid = 192,
              duration = 350
            },
            {
              tileid = 160,
              duration = 400
            }
          }
        },
        {
          id = 193,
          animation = {
            {
              tileid = 193,
              duration = 350
            },
            {
              tileid = 161,
              duration = 200
            }
          }
        },
        {
          id = 194,
          animation = {
            {
              tileid = 194,
              duration = 200
            },
            {
              tileid = 162,
              duration = 300
            }
          }
        },
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
            ["jumpthru"] = false,
            ["platform"] = true
          }
        },
        {
          id = 262,
          properties = {
            ["collidable"] = true,
            ["jumpthru"] = true,
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
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "bounds",
      class = "",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 240,
          height = 128,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["bg"] = "test"
          }
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 0,
          width = 240,
          height = 128,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["bg"] = "test2"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "collision",
      class = "",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = -8,
          y = 0,
          width = 8,
          height = 128,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 0,
          width = 8,
          height = 128,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["collidable"] = true,
            ["platform"] = true
          }
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 60,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 195, 193, 195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 263, 263, 263, 263, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 194, 0, 195, 193, 193, 195, 0, 0, 260, 261, 261, 261, 226, 261, 227, 0, 0, 0, 0, 193, 195, 0, 0, 0, 0, 0, 0, 0, 193, 195, 193, 194, 193, 193, 193, 193, 195, 194, 0, 0, 0, 0, 193, 195, 194, 193, 194, 195, 0, 0, 195, 195, 193, 195, 195, 0, 0,
        225, 226, 226, 261, 226, 261, 226, 261, 226, 261, 226, 228, 258, 326, 293, 290, 290, 229, 226, 261, 261, 261, 226, 227, 0, 0, 0, 225, 226, 226, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261, 261,
        257, 326, 293, 325, 326, 326, 325, 290, 291, 326, 290, 290, 290, 258, 290, 290, 258, 290, 291, 326, 325, 258, 258, 259, 0, 0, 0, 257, 293, 290, 293, 326, 293, 326, 293, 290, 325, 293, 258, 258, 290, 325, 325, 325, 325, 326, 326, 258, 325, 258, 293, 325, 326, 291, 258, 258, 325, 326, 326, 326,
        257, 290, 293, 291, 258, 290, 293, 291, 290, 325, 258, 291, 325, 326, 291, 293, 291, 258, 325, 290, 291, 325, 326, 259, 0, 0, 0, 257, 291, 258, 258, 293, 325, 291, 291, 258, 258, 326, 326, 258, 293, 290, 293, 291, 290, 258, 293, 258, 325, 290, 325, 293, 293, 291, 258, 258, 325, 290, 290, 290
      }
    }
  }
}

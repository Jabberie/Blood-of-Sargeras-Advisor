--------------------------------------------------------------------------------
---------------------        Output to Chat      -------------------------------
-- Credit: https://www.reddit.com/r/woweconomy/comments/5gsscz/bos_appraiser/ --
--------------------------------------------------------------------------------
function BoS_Advisior_Output()
   local items = 
   {
      { ["id"] = "i:124117", ["qty"] = 10},
      { ["id"] = "i:124118", ["qty"] = 10},
      { ["id"] = "i:124119", ["qty"] = 10},
      { ["id"] = "i:124120", ["qty"] = 10},
      { ["id"] = "i:124121", ["qty"] = 10},
      { ["id"] = "i:124107", ["qty"] = 10},
      { ["id"] = "i:124108", ["qty"] = 10},
      { ["id"] = "i:124109", ["qty"] = 10},
      { ["id"] = "i:124110", ["qty"] = 10},
      { ["id"] = "i:124111", ["qty"] = 10},
      { ["id"] = "i:124112", ["qty"] = 10},
      { ["id"] = "i:124101", ["qty"] = 10},
      { ["id"] = "i:124102", ["qty"] = 10},
      { ["id"] = "i:124103", ["qty"] = 10},
      { ["id"] = "i:124104", ["qty"] = 10},
      { ["id"] = "i:124105", ["qty"] = 3},
      { ["id"] = "i:123918", ["qty"] = 10},
      { ["id"] = "i:123919", ["qty"] = 5},
      { ["id"] = "i:124113", ["qty"] = 10},
      { ["id"] = "i:124115", ["qty"] = 10},
      { ["id"] = "i:124438", ["qty"] = 20},
      { ["id"] = "i:124439", ["qty"] = 20},
      { ["id"] = "i:124437", ["qty"] = 10},
      { ["id"] = "i:124440", ["qty"] = 10},
      { ["id"] = "i:124441", ["qty"] = 3}
   }
   
   for k, item in pairs(items) do
      item.link = TSMAPI.Item:GetLink(item.id) 
      item.value = TSMAPI:GetCustomPriceValue("dbmarket",item.id) * item.qty
   end
   
   table.sort(items, function(lhs, rhs)
         return lhs.value > rhs.value
   end)
   
   for k, item in pairs(items) do
      print(item.link .." "..TSMAPI:MoneyToString(item.value))
   end
end

--------------------------------------------------------------------------------
---------------------        slash commands      -------------------------------
--------------------------------------------------------------------------------

SLASH_BOSA1, SLASH_BOSA2 = '/bosa', '/bosadvisior'; -- 3.
function SlashCmdList.BOSA()
   BoS_Advisior_Output();
end
local _
local FilteredNamePlate = _G.FilteredNamePlate
local GetNamePlates = C_NamePlate.GetNamePlates
--local IS_DEBUG = true
FilteredNamePlate.UITypeCheckList = {
	[0] = false,
	[1] = false,
	[2] = false,
	[3] = false,
	[4] = false,
	[5] = false,
	[6] = false,
	[7] = false,
	[8] = false,
	[9] = false,
	[10] = false,
}

FilteredNamePlate.UITypeList = {
	[0] = FNP_LOCALE_TEXT.FNP_ORIG_TITLE,
	[1] = FNP_LOCALE_TEXT.FNP_ORIG_TITLE2,
	[2] = "TidyPlates",
	[3] = "Kui_NamePlates",
	[4] = "RayUI",
	[5] = "EUI/NDUI/ElvUI",
	[6] = FNP_LOCALE_TEXT.FNP_EKNUM_TITLE,
	[7] = "ShestackUI",
	[8] = "CblUI",
	[9] = "Plater",
	[10] = "第一第二选项另一模式",
}

FilteredNamePlate.curScaleList = {}

-- UIType  ->     majorNpFlag  majorFrame
-- 原生      0,1	  0	     UnitFrame
-- TidyPlates 简单2   1	      carrier
-- KUI        简单3   1	        kui
--  RayUI      简单4  1	      UnitFrame
-- NDUI/EUI	   简单5  1       unitFrame
-- EKNum         6	  2	      UnitFrame
-- she         7	  1	      UnitFrame
-- CBL          8	  4	      UnitFrame
-- plater      9/10	  5     unitFrame
function FilteredNamePlate:GenCurNpFlags()
	local typeFlag = 0 -- 上述UIType的下标
	if Fnp_OtherNPFlag == 0 or Fnp_OtherNPFlag == 1 then
		typeFlag = 0
	elseif Fnp_OtherNPFlag == 6 then
		typeFlag = 2
	elseif Fnp_OtherNPFlag == 8 then
		typeFlag = 4
	elseif Fnp_OtherNPFlag == 9 then
		typeFlag = 5
	elseif Fnp_OtherNPFlag == 10 then -- 原生另外一种模式
		typeFlag = 3
	else -- 最简模型 /SHE
		typeFlag = 1
	end

	local typeName = "UnitFrame"
	if Fnp_OtherNPFlag == 2 then
		typeName = "carrier"
	elseif Fnp_OtherNPFlag == 3 then
		typeName = "kui"
	elseif Fnp_OtherNPFlag == 5 or Fnp_OtherNPFlag == 9 or Fnp_OtherNPFlag == 7 then
		typeName = "unitFrame"
	end

	return typeFlag, typeName
end

function FilteredNamePlate:ChangedSavedScaleList(flag)
     Fnp_SavedScaleList.only = 1.4
     Fnp_SavedScaleList.small = 0.25
	 --配置不同UI下 small的默认比例
	if flag == 10 then
		Fnp_SavedScaleList.small = 0.5
		Fnp_SavedScaleList.only = 1.3
	elseif flag == 9 then
		Fnp_SavedScaleList.small = 0.5
		Fnp_SavedScaleList.only = 1.3
	elseif flag == 7 then
		Fnp_SavedScaleList.small = 0.4
		Fnp_SavedScaleList.only = 1.2
	elseif flag == 8 then
		Fnp_SavedScaleList.small = 0.15
		Fnp_SavedScaleList.only = 1.2
	elseif flag == 0 or flag == 1 then
		Fnp_SavedScaleList.small = 0.2
		Fnp_SavedScaleList.only = 1.3
	elseif flag == 6 then
		Fnp_SavedScaleList.small = 0.2
		Fnp_SavedScaleList.only = 1.1		
	elseif flag == 3 or flag == 2 then
		Fnp_SavedScaleList.only = 1.3
		Fnp_SavedScaleList.small = 0.25
	end
end

-- 分major总数的类型进行适配缩放比 --
function FilteredNamePlate:reinitScaleValues(majorFlag)
	local SPELL_SCALE = 0.5
	if majorFlag == 1 then
		SPELL_SCALE = 0.65
		FilteredNamePlate.curScaleList.normal = FilteredNamePlate.curScaleList.SYSTEM * Fnp_SavedScaleList.normal
		FilteredNamePlate.curScaleList.small = FilteredNamePlate.curScaleList.normal * Fnp_SavedScaleList.small
		FilteredNamePlate.curScaleList.middle = FilteredNamePlate.curScaleList.normal * SPELL_SCALE
		FilteredNamePlate.curScaleList.only = FilteredNamePlate.curScaleList.SYSTEM * Fnp_SavedScaleList.only
	elseif majorFlag == 0 or majorFlag == 3 then
		FilteredNamePlate.curScaleList.name.only = FilteredNamePlate.curScaleList.name.SYSTEM * Fnp_SavedScaleList.only
		FilteredNamePlate.curScaleList.name.small = FilteredNamePlate.curScaleList.name.SYSTEM * Fnp_SavedScaleList.small
		FilteredNamePlate.curScaleList.name.middle = FilteredNamePlate.curScaleList.name.small
		if FilteredNamePlate.curScaleList.name.small < 25 then
			FilteredNamePlate.curScaleList.name.small = 25
			FilteredNamePlate.curScaleList.name.middle = 25
		end
		FilteredNamePlate.curScaleList.bars.heal_normalHeight = FilteredNamePlate.curScaleList.bars.HEAL_SYS_HEIGHT * Fnp_SavedScaleList.normal;
		FilteredNamePlate.curScaleList.bars.heal_onlyHeight = FilteredNamePlate.curScaleList.bars.HEAL_SYS_HEIGHT * Fnp_SavedScaleList.only;
		FilteredNamePlate.curScaleList.bars.cast_midHeight = FilteredNamePlate.curScaleList.bars.CAST_SYS_HEIGHT * SPELL_SCALE;
	elseif majorFlag == 2 then
		FilteredNamePlate.curScaleList.normal_perc_font = FilteredNamePlate.curScaleList.PERC_FONT * Fnp_SavedScaleList.normal
		FilteredNamePlate.curScaleList.only_perc_font = FilteredNamePlate.curScaleList.PERC_FONT * Fnp_SavedScaleList.only
		FilteredNamePlate.curScaleList.mid_perc_font = FilteredNamePlate.curScaleList.normal_perc_font * SPELL_SCALE
		FilteredNamePlate.curScaleList.small_perc_font = FilteredNamePlate.curScaleList.normal_perc_font * Fnp_SavedScaleList.small
	elseif majorFlag == 4 then
		FilteredNamePlate.curScaleList.nor_scale = FilteredNamePlate.curScaleList.SYS_SCALE * Fnp_SavedScaleList.normal
		FilteredNamePlate.curScaleList.only_scale = FilteredNamePlate.curScaleList.SYS_SCALE * Fnp_SavedScaleList.only
		FilteredNamePlate.curScaleList.mid_scale = FilteredNamePlate.curScaleList.nor_scale * SPELL_SCALE
		FilteredNamePlate.curScaleList.small_scale = FilteredNamePlate.curScaleList.nor_scale * Fnp_SavedScaleList.small
	end
end

-- 返回值true代表已经获取了系统血条的真正大小，false表示UITYPE出错
function FilteredNamePlate:initScaleValues(majorFlag, otherFlag, majorFrame)
	--if true then print("initScaleValues majorFlag "..majorFlag..",otherFlag "..otherFlag.." majorFr "..majorFrame) end

	local isScaleInited = false

	for _, frame in pairs(GetNamePlates()) do
		local foundUnit = (frame.namePlateUnitToken or (frame.UnitFrame and frame.UnitFrame.unit))
		if otherFlag == 5 then
			foundUnit = (frame.unitFrame and frame.unitFrame.unit)
		elseif otherFlag == 9 then
			foundUnit = frame and frame.unitFramePlater
		elseif otherFlag == 7 then
			foundUnit = frame and frame.unitFrame
		end
		--print("----");FilteredNamePlate.printTable(frame.unitFrame)
		local sys = 0

		if foundUnit then
			--if true then print("found it!!") end
			if majorFlag == 5 then -- 对于某种直接操作血条显示的情况，就不做任何scale处理了。
				sys = 1
			elseif majorFlag == 0 or majorFlag == 3 then --Orig模型 调节名字宽度，调节血条高度，施法条高度
				FilteredNamePlate.curScaleList = {
					name = {
						SYSTEM = 180,
						only = 220,
						small = 40,
						middle = 40,
					},
					bars = {
						HEAL_SYS_HEIGHT = 10.8,
						heal_normalHeight = 10.8,
						heal_onlyHeight = 15.0,
						CAST_SYS_HEIGHT = 10.8,
						cast_midHeight = 5.4
					}
				}
				if frame.UnitFrame then
					sys = 1
					FilteredNamePlate.curScaleList.name.SYSTEM = frame.UnitFrame:GetWidth()
					if frame.UnitFrame.healthBar then
						FilteredNamePlate.curScaleList.bars.HEAL_SYS_HEIGHT = frame.UnitFrame.healthBar:GetHeight()
					end
					if frame.UnitFrame.castBar then
						FilteredNamePlate.curScaleList.bars.CAST_SYS_HEIGHT = frame.UnitFrame.castBar:GetHeight()
					end
				end
			elseif majorFlag == 2 then -- ek number 模型 调节名字宽度和高度，调节血量字体大小
				FilteredNamePlate.curScaleList = {
					SYSTEMW = 180,
					SMALLW = 40,
					SYSTEMH = 100,
					SMALLH = 20,

					PERC_FONT = 18,
					normal_perc_font = 18,
					only_perc_font = 10,
					mid_perc_font = 15,
					small_perc_font = 8,
				}
				if frame.UnitFrame then
					sys = 1
					FilteredNamePlate.curScaleList.SYSTEMW = frame.UnitFrame.name:GetWidth()
					FilteredNamePlate.curScaleList.SYSTEMH = frame.UnitFrame.name:GetHeight()
					if frame.UnitFrame.healthperc then
						local face,size,flag = frame.UnitFrame.healthperc:GetFont()
						FilteredNamePlate.curScaleList.fontFace = face
						FilteredNamePlate.curScaleList.fontFlag = flag
						FilteredNamePlate.curScaleList.PERC_FONT = size
					end
				end
			elseif majorFlag == 4 then -- CblUI
				FilteredNamePlate.curScaleList = {
					NAME_SYSTEMW = 180,
					NAME_SMALLW = 40,

					SYS_SCALE = 1.0,
					nor_scale = 1.0,
					only_scale = 1.3,
					mid_scale = 0.5,
					small_scale = 0.2,
				}
				if frame.UnitFrame then
					sys = 1
					FilteredNamePlate.curScaleList.NAME_SYSTEMW = frame.UnitFrame.name:GetWidth()
					if frame.UnitFrame.healthBar then
						FilteredNamePlate.curScaleList.SYS_SCALE = frame.UnitFrame.healthBar:GetEffectiveScale()
					end
				end
			else -- 1 纯条模型 最简单啦 直接调节整体frame scale
				sys = 1
				FilteredNamePlate.curScaleList = {
					SYSTEM = 1.0,
					normal = 1.0,
					small = 0.20,
					middle = 0.5,
					only = 1.45,
				}
				if frame[majorFrame] then
					--if true then print("system inital   "..tostring(frame[majorFrame]:GetEffectiveScale())) end
					if otherFlag == 5 then
						FilteredNamePlate.curScaleList.SYSTEM = 1 -- frame[majorFrame]:GetEffectiveScale()
					else
						FilteredNamePlate.curScaleList.SYSTEM = frame[majorFrame]:GetEffectiveScale()
					end
				end
			end
		end

		if sys > 0.01 then -- it's a real info
			FilteredNamePlate:reinitScaleValues(majorFlag)
			isScaleInited = true
			break
		end
	end

	return isScaleInited
end


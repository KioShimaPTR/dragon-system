//Search:

const int ITEM_BROKEN_METIN_VNUM = 28960;

//Add below:

int ejderde_kac_kisiyiz = 0;

//Search:

	int pc_warp_as_observer(lua_State * L)

//Add on:

	struct EjderKisi
	{
		EjderKisi() {};
		void operator()(LPENTITY ent)
		{
			if (ent->IsType(ENTITY_CHARACTER))
			{
				LPCHARACTER ch = (LPCHARACTER) ent;
				if (ch->IsPC())
				{
					if (!ch->IsPC() || ch->IsObserverMode())
						return;

					ejderde_kac_kisiyiz = ejderde_kac_kisiyiz + 1;
				}
			}
		}
	};
	
	int pc_ejder_kontrol(lua_State * L)
	{
		LPSECTREE_MAP pSecMap = SECTREE_MANAGER::instance().GetMap(lua_tonumber(L,1));

		if (pSecMap)
		{
			EjderKisi f;
			ejderde_kac_kisiyiz = 0;
			pSecMap->for_each( f );
			lua_pushnumber(L, ejderde_kac_kisiyiz);
		}

		return 1;
	}

//Search:

			{ "warp_as_observer", pc_warp_as_observer },

//Add below:

			{ "ejder_kontrol", pc_ejder_kontrol },
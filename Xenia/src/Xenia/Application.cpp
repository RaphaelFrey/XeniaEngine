#include "Application.h"

#include "Log.h"
#include "Events/ApplicationEvent.h"

namespace Xenia {

	Application::Application()
	{

	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		if(e.IsInCategory(EventCategoryApplication))
		{
			XN_TRACE(e);
		}
		if(e.IsInCategory(EventCategoryInput))
		{
			XN_TRACE(e);
		}
		while (true);
	}

}

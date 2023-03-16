#pragma once
#include <stdio.h>


#ifdef XN_PLATFORM_WINDOWS

extern Xenia::Application* Xenia::CreateApplication();

int main(int argc, char** argv)
{
	Xenia::Log::Init();
	XN_CORE_WARN("Initialized Log!");
	int a = 5;
	XN_INFO("Hello! VAR={0}", 5);

	printf("Xenia Engine\n");
	auto app = Xenia::CreateApplication();
	app->Run();
	delete app;
}

#endif
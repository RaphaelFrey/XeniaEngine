#pragma once
#include <stdio.h>


#ifdef XN_PLATFORM_WINDOWS

extern Xenia::Application* Xenia::CreateApplication();

int main(int argc, char** argv)
{
	printf("Xenia Engine\n");
	auto app = Xenia::CreateApplication();
	app->Run();
	delete app;
}

#endif
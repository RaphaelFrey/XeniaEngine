#include <Xenia.h>

class Sandbox : public Xenia::Application {
public:
	Sandbox()
	{

	}

	~Sandbox()
	{

	}
};

Xenia::Application* Xenia::CreateApplication()
{
	return new Sandbox();
}
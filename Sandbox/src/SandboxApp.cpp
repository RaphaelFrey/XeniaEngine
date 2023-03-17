#include <Xenia.h>

class ExampleLayer : public Xenia::Layer
{
public:
	ExampleLayer() : Layer("Example") {}
	void OnUpdate() override
	{
		XN_INFO("ExampleLayer::Update");
	}

	void OnEvent(Xenia::Event& event) override
	{
		XN_TRACE("{0}", event);
	}
};


class Sandbox : public Xenia::Application {
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
	}

	~Sandbox()
	{

	}
};

Xenia::Application* Xenia::CreateApplication()
{
	return new Sandbox();
}
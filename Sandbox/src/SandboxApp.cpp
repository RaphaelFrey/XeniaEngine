#include <Xenia.h>

class ExampleLayer : public Xenia::Layer
{
public:
	ExampleLayer() : Layer("Example") {}
	
	void OnUpdate() override
	{
		if (Xenia::Input::IsKeyPressed(XN_KEY_TAB))
			XN_TRACE("Tab key is pressed (poll)!");
	}

	void OnEvent(Xenia::Event& event) override
	{
		if (event.GetEventType() == Xenia::EventType::KeyPressed)
		{
			Xenia::KeyPressedEvent& e = (Xenia::KeyPressedEvent&)event;
			if (e.GetKeyCode() == XN_KEY_TAB)
				XN_TRACE("Tab key is pressed (event)!");
			XN_TRACE("{0}", (char)e.GetKeyCode());
		}
	}
};


class Sandbox : public Xenia::Application {
public:
	Sandbox()
	{
		PushLayer(new ExampleLayer());
		PushOverlay(new Xenia::ImGuiLayer());
	}

	~Sandbox()
	{

	}
};

Xenia::Application* Xenia::CreateApplication()
{
	return new Sandbox();
}
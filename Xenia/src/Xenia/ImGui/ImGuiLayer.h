#pragma once

#include "Xenia//Layer.h"
#include "Xenia/Events/KeyEvent.h"
#include "Xenia/Events/MouseEvents.h"
#include "Xenia/Events/ApplicationEvent.h"

namespace Xenia {

    class XENIA_API ImGuiLayer : public Layer
    {
    public:
        ImGuiLayer();
        ~ImGuiLayer();

        void OnAttach() override;
        void OnDetach() override;
        void OnImGuiRender() override;

        void Begin();
        void End();
    private:
        float m_Time = 0.0f;
    };

}
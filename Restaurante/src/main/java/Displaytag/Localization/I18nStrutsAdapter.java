/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Displaytag.Localization;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.LocaleProvider;
import com.opensymphony.xwork2.TextProvider;
import com.opensymphony.xwork2.util.ValueStack;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.views.jsp.TagUtils;
import org.displaytag.Messages;
import org.displaytag.localization.I18nResourceProvider;
import org.displaytag.localization.LocaleResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.Tag;
import java.util.Iterator;
import java.util.Locale;

/**
 *
 * @author ang_2
 */
public class I18nStrutsAdapter implements LocaleResolver, I18nResourceProvider {

    /**
     * prefix/suffix for missing entries.
     */
    public static final String UNDEFINED_KEY = "???"; //$NON-NLS-1$

    /**
     * logger.
     */
    private static final Log LOG = LogFactory.getLog(I18nStrutsAdapter.class);

    /**
     * @see LocaleResolver#resolveLocale(javax.servlet.http.HttpServletRequest)
     */
    @Override
    public Locale resolveLocale(HttpServletRequest request) {

        Locale result = null;
        ValueStack stack = ActionContext.getContext().getValueStack();

        Iterator iterator = stack.getRoot().iterator();
        while (iterator.hasNext()) {
            Object o = iterator.next();

            if (o instanceof LocaleProvider) {
                LocaleProvider lp = (LocaleProvider) o;
                result = lp.getLocale();

                break;
            }
        }

        if (result == null) {
            LOG.debug("Missing LocalProvider actions, init locale to default");
            result = Locale.getDefault();
        }

        return result;
    }

    /**
     * @param pageContext
     * @see I18nResourceProvider#getResource(String, String,
     * javax.servlet.jsp.tagext.Tag , javax.servlet.jsp.PageContext)
     */
    @Override
    public String getResource(String resourceKey, String defaultValue, Tag tag,
            PageContext pageContext) {

        // if resourceKey isn't defined either, use defaultValue
        String key = (resourceKey != null) ? resourceKey : defaultValue;
        String message = null;
        ValueStack stack = TagUtils.getStack(pageContext);
        Iterator iterator = stack.getRoot().iterator();

        while (iterator.hasNext()) {
            Object o = iterator.next();

            if (o instanceof TextProvider) {
                TextProvider tp = (TextProvider) o;
                message = tp.getText(key);

                break;
            }
        }

        // if user explicitely added a titleKey we guess this is an error
        if (message == null && resourceKey != null) {
            LOG.debug(Messages
                    .getString("Localization.missingkey", resourceKey)); //$NON-NLS-1$
            message = UNDEFINED_KEY + resourceKey + UNDEFINED_KEY;
        }

        return message;
    }

}